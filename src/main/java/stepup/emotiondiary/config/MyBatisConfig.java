package stepup.emotiondiary.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

@Configuration
@MapperScan("stepup.emotiondiary.mapper")
public class MyBatisConfig {
	
	@Bean
	public SqlSessionFactory sqlSessionFactory() throws Exception{
		
		SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
		factoryBean.setDataSource(dataSource());
		
		return factoryBean.getObject();
		
	}
	
	@Bean
	public DataSource dataSource() {
		
		HikariConfig config = new HikariConfig();
		
		config.setDriverClassName("com.mysql.jdbc.Driver");
		config.setJdbcUrl("jdbc:mysql://15.164.250.135:3305/test_db");
		config.setUsername("root");
		config.setPassword("3131");
		
		HikariDataSource ds = new HikariDataSource(config);
		
		return ds;
		
	}

}
