package top.fkxuexi.smk.common.config.dbconfig;


import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.support.http.StatViewServlet;
import com.alibaba.druid.support.http.WebStatFilter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.servlet.ServletRegistration;
import javax.sql.DataSource;

@Configuration
@EnableTransactionManagement
public class DruidConfig {

    private Logger log = LoggerFactory.getLogger(DruidConfig.class);

    @Bean(name = "dataSource")
    @ConfigurationProperties(prefix = "spring.datasource")
    public DataSource dataSource(){
        log.debug("druid datasource init --------------------");
        return new DruidDataSource();
    }

    @Bean
    public ServletRegistrationBean druidServlet(){
        log.debug("druid servlet start------------------");
        ServletRegistrationBean druidServlet = new ServletRegistrationBean(new StatViewServlet(), "/druid/*");
        return druidServlet;
    }

    @Bean
    public FilterRegistrationBean filterRegistrationBean() {
        FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean(new WebStatFilter());
        filterRegistrationBean.addUrlPatterns("/*");
        filterRegistrationBean.addInitParameter("exclusions", "*.js,*.gif,*.jpg,*.png,*.css,*.ico,/druid/*");
        return filterRegistrationBean;
    }

}
