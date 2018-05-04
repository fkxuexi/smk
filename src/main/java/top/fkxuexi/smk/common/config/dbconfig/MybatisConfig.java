package top.fkxuexi.smk.common.config.dbconfig;

import com.github.pagehelper.PageHelper;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.Properties;

@Configuration
public class MybatisConfig {

    @Bean
    public PageHelper pageHelper(){
        PageHelper pageHelper = new PageHelper();
        Properties p = new Properties();
        //  pageSizeZero 如果pageSize 为0的话，则返回所有的结果
        p.setProperty("pageSizeZero","true");
        //  可以返回记录的总数
        p.setProperty("PageRowBounds","true");

        pageHelper.setProperties(p);
        return  pageHelper;
    }
}
