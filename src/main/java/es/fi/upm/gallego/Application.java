package es.fi.upm.gallego;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@Configuration
@ComponentScan(basePackages = "es.fi.upm.gallego")
@Import({BeanConfig.class, WebConfig.class})

@SpringBootApplication(scanBasePackages= {"es.fi.upm.gallego","es.fi.upm.gallego.controller","es.fi.upm.gallego.service"})
@EntityScan("es.fi.upm.gallego.model")
@EnableJpaRepositories("es.fi.upm.gallego.repository")


@EnableAutoConfiguration
public class Application extends org.springframework.boot.web.support.SpringBootServletInitializer{
	
	 private static Class<Application> applicationClass = Application.class;

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(applicationClass);
    }

}