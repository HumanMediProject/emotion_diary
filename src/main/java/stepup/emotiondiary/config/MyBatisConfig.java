package stepup.emotiondiary.config;


import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.yaml.snakeyaml.Yaml;

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
	
	@SuppressWarnings("unchecked")
	@Bean
	public DataSource dataSource() {
		HikariConfig config = new HikariConfig();
		try {
			System.out.println("현재 작업 디렉토리: " + System.getProperty("user.dir"));
			Map<String, Object> propMap = new Yaml().load(new FileReader("hello.yml"));
			Map<String, String> databaseConfig = (Map<String, String>)propMap.get("database");
			
			config.setDriverClassName("com.mysql.jdbc.Driver");
			config.setJdbcUrl(databaseConfig.get("jdbcurl"));
			config.setUsername(databaseConfig.get("username"));
			String password = String.valueOf(databaseConfig.get("password"));
			config.setPassword(password);

		}catch(FileNotFoundException e) {
			e.printStackTrace();
		}
		
		
		HikariDataSource ds = new HikariDataSource(config);
		
		return ds;
		
	}

}
