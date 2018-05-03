package top.fkxuexi.smk;


import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

public class SmkServletApplication  extends SpringBootServletInitializer{

    /**
     * 这个适用于tomcat下的运行的
     */
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(SmkApplication.class);
    }
}
