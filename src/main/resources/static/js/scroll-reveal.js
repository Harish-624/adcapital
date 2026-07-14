/**
 * scroll-reveal.js — Adcapital Sitewide Scroll Animation (v1.1)
 *
 * Applies GPU-only (transform + opacity) staggered reveal animations.
 * Uses CSS classes: .sr-section, .sr-child, .no-reverse
 * Distinct from home.jsp's .stagger-* system to avoid conflicts.
 *
 * Performance: Only transform & opacity are animated → Compositor thread only.
 * No layout, no paint, no jank.
 *
 * rootMargin: '0px' — observer fires the instant any edge of the element
 * crosses the viewport boundary. This ensures NO dead zone where two adjacent
 * sections are both invisible simultaneously (which caused the white-flash bug).
 */
document.addEventListener("DOMContentLoaded", function () {
    var srSections = document.querySelectorAll('.sr-section');
    var srReveals = document.querySelectorAll('.sr-reveal');
    if (!srSections.length && !srReveals.length) return; // bail fast if page has no sr-elements

    /**
     * Assigns sequential CSS index variables to all stagger children.
     * --sr-idx       → used for forward cascade (1, 2, 3, 4…)
     * --sr-idx-rev   → used for reverse cascade (N, N-1, N-2…)
     */
    function assignIndices(section) {
        // Exclude carousel items — they get their own index via Owl events
        var children = Array.from(section.querySelectorAll('.sr-child:not(.owl-item .sr-child)'));
        var total = children.length;
        children.forEach(function (child, idx) {
            child.style.setProperty('--sr-idx', idx + 1);
            child.style.setProperty('--sr-idx-rev', total - idx);
        });
    }

    /**
     * Assigns stagger indices to active carousel items only.
     * This ensures only the currently visible items get sequenced.
     */
    function assignCarouselIndices(carousel) {
        if (!carousel) return;
        var activeItems = carousel.querySelectorAll('.owl-item.active');
        activeItems.forEach(function (item, idx) {
            item.style.setProperty('--sr-carousel-idx', idx + 1);
        });
    }

    var observer = new IntersectionObserver(function (entries) {
        entries.forEach(function (entry) {
            var el = entry.target;

            if (entry.isIntersecting) {
                // Determine scroll direction for cascade order
                var isScrollingUp = entry.boundingClientRect.top < window.innerHeight / 2;
                var noReverse = el.classList.contains('no-reverse');

                if (isScrollingUp && !noReverse) {
                    el.classList.remove('sr-fwd');
                    el.classList.add('sr-rev');
                } else {
                    el.classList.remove('sr-rev');
                    el.classList.add('sr-fwd');
                }

                // Assign sequential indices before transition fires
                assignIndices(el);

                // Handle any Owl Carousels inside the section
                el.querySelectorAll('.owl-carousel').forEach(function (carousel) {
                    assignCarouselIndices(carousel);
                });

                // Trigger reveal
                el.classList.remove('exit-top', 'exit-bottom');
                el.classList.add('in-view');

            } else {
                // Reset to hidden so the animation re-fires on the next scroll pass.
                // This matches exactly how contact-us, mutual-fund, and about-us work.
                // exit-bottom is now safe because all GPU-intensive animations
                // (floatIcon, backdrop-filter, kenBurns, heroEntrance) have been removed.
                el.classList.remove('in-view');
                if (entry.boundingClientRect.top < 0) {
                    el.classList.remove('exit-bottom');
                    el.classList.add('exit-top');
                } else {
                    el.classList.remove('exit-top');
                    el.classList.add('exit-bottom');
                }
            }
        });
    }, {
        rootMargin: '0px 0px 0px 0px',
        threshold: 0
    });

    srSections.forEach(function (el) { observer.observe(el); });

    // Simple observer for single .sr-reveal elements (no stagger — just fade up on enter, fade out on exit)
    if (srReveals.length) {
        var revealObserver = new IntersectionObserver(function (entries) {
            entries.forEach(function (entry) {
                var el = entry.target;
                if (entry.isIntersecting) {
                    el.classList.remove('exit-top', 'exit-bottom');
                    el.classList.add('in-view');
                } else {
                    // Disable exit animations to prevent scroll lag.
                    /*
                    el.classList.remove('in-view');
                    if (entry.boundingClientRect.top < 0) {
                        el.classList.remove('exit-bottom');
                        el.classList.add('exit-top');
                    } else {
                        el.classList.remove('exit-top');
                        el.classList.add('exit-bottom');
                    }
                    */
                }
            });
        }, {
            rootMargin: '0px 0px 0px 0px',
            threshold: 0
        });
        srReveals.forEach(function (el) { revealObserver.observe(el); });
    }

    // Hook into Owl Carousel's own events to keep indices in sync
    // after initialization and after each slide transition.
    if (typeof $ !== 'undefined') {
        $(document).ready(function () {
            $('.sr-section .owl-carousel').on('initialized.owl.carousel translated.owl.carousel', function (e) {
                assignCarouselIndices(e.target);
            });

            // Safety pass: assign indices for already-initialized carousels
            setTimeout(function () {
                document.querySelectorAll('.sr-section .owl-carousel').forEach(function (carousel) {
                    assignCarouselIndices(carousel);
                });
            }, 150);
        });
    }
});
