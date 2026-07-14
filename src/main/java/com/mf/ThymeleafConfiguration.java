package com.mf;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.thymeleaf.spring5.SpringTemplateEngine;
import org.thymeleaf.templatemode.TemplateMode;
import org.thymeleaf.templateresolver.ClassLoaderTemplateResolver;

@Configuration
public class ThymeleafConfiguration {
  
  @Bean
  public ClassLoaderTemplateResolver templateResolver(){
    ClassLoaderTemplateResolver templateResolver=new ClassLoaderTemplateResolver();
    
    templateResolver.setPrefix("templates/");
    templateResolver.setCacheable(false);
    templateResolver.setSuffix(".html");
    templateResolver.setTemplateMode(TemplateMode.HTML);
    templateResolver.setCharacterEncoding("UTF-8");
    
    return templateResolver;
  }
  
  @Bean
  public SpringTemplateEngine templateEngine() {
		SpringTemplateEngine templateEngine = new SpringTemplateEngine();
		templateEngine.setTemplateResolver(templateResolver());
		return templateEngine;
  }
  
  @Bean
  public InternalResourceViewResolver jspViewResolver() {
      InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
      viewResolver.setPrefix("/WEB-INF/jsp/");
      viewResolver.setSuffix(".jsp");
      viewResolver.setViewClass(JstlView.class);
      viewResolver.setOrder(0);
      return viewResolver;
  }
}