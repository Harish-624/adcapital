package com.mf.amfi.model;

import static javax.persistence.GenerationType.IDENTITY;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "scheme_quartile_ranking_annual_returns")
public class SchemeQuartileRankingAnnualReturns {

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id")
	private Integer id;
	private String scheme_amfi;
	private String scheme_amfi_code;
	private String scheme_category;
	private String scheme_company;
	private Date inception_date;
	private double scheme_assets;
	private String scheme_asset_date;
	
	private String scheme_amfi_short_name;
	private String category_short_name;
	private String scheme_plan_type;
	private double ter;	
	
	private String url;	
		
	private double returns_2012;
	private String returns_quartile_rank_2012;
	private double category_returns_2012;
	private String returns_rank_2012;
	private String returns_rank_tot_2012;
	
	private double returns_2013;
	private String returns_quartile_rank_2013;
	private double category_returns_2013;
	private String returns_rank_2013;
	private String returns_rank_tot_2013;
	
	
	private double returns_2014;
	private String returns_quartile_rank_2014;
	private double category_returns_2014;
	private String returns_rank_2014;
	private String returns_rank_tot_2014;
	
	private double returns_2015;
	private String returns_quartile_rank_2015;
	private double category_returns_2015;
	private String returns_rank_2015;
	private String returns_rank_tot_2015;
	
	private double returns_2016;
	private String returns_quartile_rank_2016;
	private double category_returns_2016;
	private String returns_rank_2016;
	private String returns_rank_tot_2016;
	
	private double returns_2017;
	private String returns_quartile_rank_2017;
	private double category_returns_2017;
	private String returns_rank_2017;
	private String returns_rank_tot_2017;
	
	private double returns_2018;
	private String returns_quartile_rank_2018;
	private double category_returns_2018;
	private String returns_rank_2018;
	private String returns_rank_tot_2018;
	
	private double returns_2019;
	private String returns_quartile_rank_2019;
	private double category_returns_2019;
	private String returns_rank_2019;
	private String returns_rank_tot_2019;
	
	private double returns_2020;
	private String returns_quartile_rank_2020;
	private double category_returns_2020;
	private String returns_rank_2020;
	private String returns_rank_tot_2020;
	
	private double returns_2021;
	private String returns_quartile_rank_2021;
	private double category_returns_2021;
	private String returns_rank_2021;
	private String returns_rank_tot_2021;
	
	private Double returns_ytd;
	private String returns_quartile_rank_ytd;
	private Double category_returns_ytd;
	private String returns_rank_ytd;
	private String returns_rank_tot_ytd;
	
	@Transient
	private String benchmark;
	
	@Transient
	private double benchmark_returns_2012;	
	
	@Transient
	private double benchmark_returns_2013;
	
	@Transient
	private double benchmark_returns_2014;
	
	@Transient
	private double benchmark_returns_2015;
	
	@Transient
	private double benchmark_returns_2016;
	
	@Transient
	private double benchmark_returns_2017;
	
	@Transient
	private double benchmark_returns_2018;
	
	@Transient
	private double benchmark_returns_2019;
	
	@Transient
	private double benchmark_returns_2020;
	
	@Transient
	private double benchmark_returns_2021;
	
	@Transient
	private double benchmark_returns_ytd;
	
	private double returns_2022;
	private String returns_quartile_rank_2022;
	private double category_returns_2022;
	private String returns_rank_2022;
	private String returns_rank_tot_2022;
	private double benchmark_returns_2022;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getScheme_amfi() {
		return scheme_amfi;
	}
	public void setScheme_amfi(String scheme_amfi) {
		this.scheme_amfi = scheme_amfi;
	}
	public String getScheme_amfi_code() {
		return scheme_amfi_code;
	}
	public void setScheme_amfi_code(String scheme_amfi_code) {
		this.scheme_amfi_code = scheme_amfi_code;
	}
	public String getScheme_category() {
		return scheme_category;
	}
	public void setScheme_category(String scheme_category) {
		this.scheme_category = scheme_category;
	}
	public String getScheme_company() {
		return scheme_company;
	}
	public void setScheme_company(String scheme_company) {
		this.scheme_company = scheme_company;
	}
	public Date getInception_date() {
		return inception_date;
	}
	public void setInception_date(Date inception_date) {
		this.inception_date = inception_date;
	}	
	public double getScheme_assets() {
		return scheme_assets;
	}
	public void setScheme_assets(double scheme_assets) {
		this.scheme_assets = scheme_assets;
	}
	public String getScheme_asset_date() {
		return scheme_asset_date;
	}
	public void setScheme_asset_date(String scheme_asset_date) {
		this.scheme_asset_date = scheme_asset_date;
	}
	public String getScheme_amfi_short_name() {
		return scheme_amfi_short_name;
	}
	public void setScheme_amfi_short_name(String scheme_amfi_short_name) {
		this.scheme_amfi_short_name = scheme_amfi_short_name;
	}
	public String getCategory_short_name() {
		return category_short_name;
	}
	public void setCategory_short_name(String category_short_name) {
		this.category_short_name = category_short_name;
	}
	public String getScheme_plan_type() {
		return scheme_plan_type;
	}
	public void setScheme_plan_type(String scheme_plan_type) {
		this.scheme_plan_type = scheme_plan_type;
	}
	public double getTer() {
		return ter;
	}
	public void setTer(double ter) {
		this.ter = ter;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public double getReturns_2012() {
		return returns_2012;
	}
	public void setReturns_2012(double returns_2012) {
		this.returns_2012 = returns_2012;
	}
	public String getReturns_quartile_rank_2012() {
		return returns_quartile_rank_2012;
	}
	public void setReturns_quartile_rank_2012(String returns_quartile_rank_2012) {
		this.returns_quartile_rank_2012 = returns_quartile_rank_2012;
	}
	public double getCategory_returns_2012() {
		return category_returns_2012;
	}
	public void setCategory_returns_2012(double category_returns_2012) {
		this.category_returns_2012 = category_returns_2012;
	}
	public String getReturns_rank_2012() {
		return returns_rank_2012;
	}
	public void setReturns_rank_2012(String returns_rank_2012) {
		this.returns_rank_2012 = returns_rank_2012;
	}
	public String getReturns_rank_tot_2012() {
		return returns_rank_tot_2012;
	}
	public void setReturns_rank_tot_2012(String returns_rank_tot_2012) {
		this.returns_rank_tot_2012 = returns_rank_tot_2012;
	}
	public double getReturns_2013() {
		return returns_2013;
	}
	public void setReturns_2013(double returns_2013) {
		this.returns_2013 = returns_2013;
	}
	public String getReturns_quartile_rank_2013() {
		return returns_quartile_rank_2013;
	}
	public void setReturns_quartile_rank_2013(String returns_quartile_rank_2013) {
		this.returns_quartile_rank_2013 = returns_quartile_rank_2013;
	}
	public double getCategory_returns_2013() {
		return category_returns_2013;
	}
	public void setCategory_returns_2013(double category_returns_2013) {
		this.category_returns_2013 = category_returns_2013;
	}
	public String getReturns_rank_2013() {
		return returns_rank_2013;
	}
	public void setReturns_rank_2013(String returns_rank_2013) {
		this.returns_rank_2013 = returns_rank_2013;
	}
	public String getReturns_rank_tot_2013() {
		return returns_rank_tot_2013;
	}
	public void setReturns_rank_tot_2013(String returns_rank_tot_2013) {
		this.returns_rank_tot_2013 = returns_rank_tot_2013;
	}
	public double getReturns_2014() {
		return returns_2014;
	}
	public void setReturns_2014(double returns_2014) {
		this.returns_2014 = returns_2014;
	}
	public String getReturns_quartile_rank_2014() {
		return returns_quartile_rank_2014;
	}
	public void setReturns_quartile_rank_2014(String returns_quartile_rank_2014) {
		this.returns_quartile_rank_2014 = returns_quartile_rank_2014;
	}
	public double getCategory_returns_2014() {
		return category_returns_2014;
	}
	public void setCategory_returns_2014(double category_returns_2014) {
		this.category_returns_2014 = category_returns_2014;
	}
	public String getReturns_rank_2014() {
		return returns_rank_2014;
	}
	public void setReturns_rank_2014(String returns_rank_2014) {
		this.returns_rank_2014 = returns_rank_2014;
	}
	public String getReturns_rank_tot_2014() {
		return returns_rank_tot_2014;
	}
	public void setReturns_rank_tot_2014(String returns_rank_tot_2014) {
		this.returns_rank_tot_2014 = returns_rank_tot_2014;
	}
	public double getReturns_2015() {
		return returns_2015;
	}
	public void setReturns_2015(double returns_2015) {
		this.returns_2015 = returns_2015;
	}
	public String getReturns_quartile_rank_2015() {
		return returns_quartile_rank_2015;
	}
	public void setReturns_quartile_rank_2015(String returns_quartile_rank_2015) {
		this.returns_quartile_rank_2015 = returns_quartile_rank_2015;
	}
	public double getCategory_returns_2015() {
		return category_returns_2015;
	}
	public void setCategory_returns_2015(double category_returns_2015) {
		this.category_returns_2015 = category_returns_2015;
	}
	public String getReturns_rank_2015() {
		return returns_rank_2015;
	}
	public void setReturns_rank_2015(String returns_rank_2015) {
		this.returns_rank_2015 = returns_rank_2015;
	}
	public String getReturns_rank_tot_2015() {
		return returns_rank_tot_2015;
	}
	public void setReturns_rank_tot_2015(String returns_rank_tot_2015) {
		this.returns_rank_tot_2015 = returns_rank_tot_2015;
	}
	public double getReturns_2016() {
		return returns_2016;
	}
	public void setReturns_2016(double returns_2016) {
		this.returns_2016 = returns_2016;
	}
	public String getReturns_quartile_rank_2016() {
		return returns_quartile_rank_2016;
	}
	public void setReturns_quartile_rank_2016(String returns_quartile_rank_2016) {
		this.returns_quartile_rank_2016 = returns_quartile_rank_2016;
	}
	public double getCategory_returns_2016() {
		return category_returns_2016;
	}
	public void setCategory_returns_2016(double category_returns_2016) {
		this.category_returns_2016 = category_returns_2016;
	}
	public String getReturns_rank_2016() {
		return returns_rank_2016;
	}
	public void setReturns_rank_2016(String returns_rank_2016) {
		this.returns_rank_2016 = returns_rank_2016;
	}
	public String getReturns_rank_tot_2016() {
		return returns_rank_tot_2016;
	}
	public void setReturns_rank_tot_2016(String returns_rank_tot_2016) {
		this.returns_rank_tot_2016 = returns_rank_tot_2016;
	}
	public double getReturns_2017() {
		return returns_2017;
	}
	public void setReturns_2017(double returns_2017) {
		this.returns_2017 = returns_2017;
	}
	public String getReturns_quartile_rank_2017() {
		return returns_quartile_rank_2017;
	}
	public void setReturns_quartile_rank_2017(String returns_quartile_rank_2017) {
		this.returns_quartile_rank_2017 = returns_quartile_rank_2017;
	}
	public double getCategory_returns_2017() {
		return category_returns_2017;
	}
	public void setCategory_returns_2017(double category_returns_2017) {
		this.category_returns_2017 = category_returns_2017;
	}
	public String getReturns_rank_2017() {
		return returns_rank_2017;
	}
	public void setReturns_rank_2017(String returns_rank_2017) {
		this.returns_rank_2017 = returns_rank_2017;
	}
	public String getReturns_rank_tot_2017() {
		return returns_rank_tot_2017;
	}
	public void setReturns_rank_tot_2017(String returns_rank_tot_2017) {
		this.returns_rank_tot_2017 = returns_rank_tot_2017;
	}
	public double getReturns_2018() {
		return returns_2018;
	}
	public void setReturns_2018(double returns_2018) {
		this.returns_2018 = returns_2018;
	}
	public String getReturns_quartile_rank_2018() {
		return returns_quartile_rank_2018;
	}
	public void setReturns_quartile_rank_2018(String returns_quartile_rank_2018) {
		this.returns_quartile_rank_2018 = returns_quartile_rank_2018;
	}
	public double getCategory_returns_2018() {
		return category_returns_2018;
	}
	public void setCategory_returns_2018(double category_returns_2018) {
		this.category_returns_2018 = category_returns_2018;
	}
	public String getReturns_rank_2018() {
		return returns_rank_2018;
	}
	public void setReturns_rank_2018(String returns_rank_2018) {
		this.returns_rank_2018 = returns_rank_2018;
	}
	public String getReturns_rank_tot_2018() {
		return returns_rank_tot_2018;
	}
	public void setReturns_rank_tot_2018(String returns_rank_tot_2018) {
		this.returns_rank_tot_2018 = returns_rank_tot_2018;
	}
	public double getReturns_2019() {
		return returns_2019;
	}
	public void setReturns_2019(double returns_2019) {
		this.returns_2019 = returns_2019;
	}
	public String getReturns_quartile_rank_2019() {
		return returns_quartile_rank_2019;
	}
	public void setReturns_quartile_rank_2019(String returns_quartile_rank_2019) {
		this.returns_quartile_rank_2019 = returns_quartile_rank_2019;
	}
	public double getCategory_returns_2019() {
		return category_returns_2019;
	}
	public void setCategory_returns_2019(double category_returns_2019) {
		this.category_returns_2019 = category_returns_2019;
	}
	public String getReturns_rank_2019() {
		return returns_rank_2019;
	}
	public void setReturns_rank_2019(String returns_rank_2019) {
		this.returns_rank_2019 = returns_rank_2019;
	}
	public String getReturns_rank_tot_2019() {
		return returns_rank_tot_2019;
	}
	public void setReturns_rank_tot_2019(String returns_rank_tot_2019) {
		this.returns_rank_tot_2019 = returns_rank_tot_2019;
	}
	public double getReturns_2020() {
		return returns_2020;
	}
	public void setReturns_2020(double returns_2020) {
		this.returns_2020 = returns_2020;
	}
	public String getReturns_quartile_rank_2020() {
		return returns_quartile_rank_2020;
	}
	public void setReturns_quartile_rank_2020(String returns_quartile_rank_2020) {
		this.returns_quartile_rank_2020 = returns_quartile_rank_2020;
	}
	public double getCategory_returns_2020() {
		return category_returns_2020;
	}
	public void setCategory_returns_2020(double category_returns_2020) {
		this.category_returns_2020 = category_returns_2020;
	}
	public String getReturns_rank_2020() {
		return returns_rank_2020;
	}
	public void setReturns_rank_2020(String returns_rank_2020) {
		this.returns_rank_2020 = returns_rank_2020;
	}
	public String getReturns_rank_tot_2020() {
		return returns_rank_tot_2020;
	}
	public void setReturns_rank_tot_2020(String returns_rank_tot_2020) {
		this.returns_rank_tot_2020 = returns_rank_tot_2020;
	}
	public double getReturns_2021() {
		return returns_2021;
	}
	public void setReturns_2021(double returns_2021) {
		this.returns_2021 = returns_2021;
	}
	public String getReturns_quartile_rank_2021() {
		return returns_quartile_rank_2021;
	}
	public void setReturns_quartile_rank_2021(String returns_quartile_rank_2021) {
		this.returns_quartile_rank_2021 = returns_quartile_rank_2021;
	}
	public double getCategory_returns_2021() {
		return category_returns_2021;
	}
	public void setCategory_returns_2021(double category_returns_2021) {
		this.category_returns_2021 = category_returns_2021;
	}
	public String getReturns_rank_2021() {
		return returns_rank_2021;
	}
	public void setReturns_rank_2021(String returns_rank_2021) {
		this.returns_rank_2021 = returns_rank_2021;
	}
	public String getReturns_rank_tot_2021() {
		return returns_rank_tot_2021;
	}
	public void setReturns_rank_tot_2021(String returns_rank_tot_2021) {
		this.returns_rank_tot_2021 = returns_rank_tot_2021;
	}
	public String getBenchmark() {
		return benchmark;
	}
	public void setBenchmark(String benchmark) {
		this.benchmark = benchmark;
	}
	public double getBenchmark_returns_2012() {
		return benchmark_returns_2012;
	}
	public void setBenchmark_returns_2012(double benchmark_returns_2012) {
		this.benchmark_returns_2012 = benchmark_returns_2012;
	}
	public double getBenchmark_returns_2013() {
		return benchmark_returns_2013;
	}
	public void setBenchmark_returns_2013(double benchmark_returns_2013) {
		this.benchmark_returns_2013 = benchmark_returns_2013;
	}
	public double getBenchmark_returns_2014() {
		return benchmark_returns_2014;
	}
	public void setBenchmark_returns_2014(double benchmark_returns_2014) {
		this.benchmark_returns_2014 = benchmark_returns_2014;
	}
	public double getBenchmark_returns_2015() {
		return benchmark_returns_2015;
	}
	public void setBenchmark_returns_2015(double benchmark_returns_2015) {
		this.benchmark_returns_2015 = benchmark_returns_2015;
	}
	public double getBenchmark_returns_2016() {
		return benchmark_returns_2016;
	}
	public void setBenchmark_returns_2016(double benchmark_returns_2016) {
		this.benchmark_returns_2016 = benchmark_returns_2016;
	}
	public double getBenchmark_returns_2017() {
		return benchmark_returns_2017;
	}
	public void setBenchmark_returns_2017(double benchmark_returns_2017) {
		this.benchmark_returns_2017 = benchmark_returns_2017;
	}
	public double getBenchmark_returns_2018() {
		return benchmark_returns_2018;
	}
	public void setBenchmark_returns_2018(double benchmark_returns_2018) {
		this.benchmark_returns_2018 = benchmark_returns_2018;
	}
	public double getBenchmark_returns_2019() {
		return benchmark_returns_2019;
	}
	public void setBenchmark_returns_2019(double benchmark_returns_2019) {
		this.benchmark_returns_2019 = benchmark_returns_2019;
	}
	public double getBenchmark_returns_2020() {
		return benchmark_returns_2020;
	}
	public void setBenchmark_returns_2020(double benchmark_returns_2020) {
		this.benchmark_returns_2020 = benchmark_returns_2020;
	}
	public double getBenchmark_returns_2021() {
		return benchmark_returns_2021;
	}
	public void setBenchmark_returns_2021(double benchmark_returns_2021) {
		this.benchmark_returns_2021 = benchmark_returns_2021;
	}
	public Double getReturns_ytd() {
		return returns_ytd;
	}
	public void setReturns_ytd(Double returns_ytd) {
		this.returns_ytd = returns_ytd;
	}
	public String getReturns_quartile_rank_ytd() {
		return returns_quartile_rank_ytd;
	}
	public void setReturns_quartile_rank_ytd(String returns_quartile_rank_ytd) {
		this.returns_quartile_rank_ytd = returns_quartile_rank_ytd;
	}
	public Double getCategory_returns_ytd() {
		return category_returns_ytd;
	}
	public void setCategory_returns_ytd(Double category_returns_ytd) {
		this.category_returns_ytd = category_returns_ytd;
	}
	public String getReturns_rank_ytd() {
		return returns_rank_ytd;
	}
	public void setReturns_rank_ytd(String returns_rank_ytd) {
		this.returns_rank_ytd = returns_rank_ytd;
	}
	public String getReturns_rank_tot_ytd() {
		return returns_rank_tot_ytd;
	}
	public void setReturns_rank_tot_ytd(String returns_rank_tot_ytd) {
		this.returns_rank_tot_ytd = returns_rank_tot_ytd;
	}
	public double getBenchmark_returns_ytd() {
		return benchmark_returns_ytd;
	}
	public void setBenchmark_returns_ytd(double benchmark_returns_ytd) {
		this.benchmark_returns_ytd = benchmark_returns_ytd;
	}
	public double getReturns_2022() {
		return returns_2022;
	}
	public void setReturns_2022(double returns_2022) {
		this.returns_2022 = returns_2022;
	}
	public String getReturns_quartile_rank_2022() {
		return returns_quartile_rank_2022;
	}
	public void setReturns_quartile_rank_2022(String returns_quartile_rank_2022) {
		this.returns_quartile_rank_2022 = returns_quartile_rank_2022;
	}
	public double getCategory_returns_2022() {
		return category_returns_2022;
	}
	public void setCategory_returns_2022(double category_returns_2022) {
		this.category_returns_2022 = category_returns_2022;
	}
	public String getReturns_rank_2022() {
		return returns_rank_2022;
	}
	public void setReturns_rank_2022(String returns_rank_2022) {
		this.returns_rank_2022 = returns_rank_2022;
	}
	public String getReturns_rank_tot_2022() {
		return returns_rank_tot_2022;
	}
	public void setReturns_rank_tot_2022(String returns_rank_tot_2022) {
		this.returns_rank_tot_2022 = returns_rank_tot_2022;
	}
	public double getBenchmark_returns_2022() {
		return benchmark_returns_2022;
	}
	public void setBenchmark_returns_2022(double benchmark_returns_2022) {
		this.benchmark_returns_2022 = benchmark_returns_2022;
	}	
}