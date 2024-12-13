package stepup.emotiondiary.config;


import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.yaml.snakeyaml.Yaml;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

@Configuration
@MapperScan("stepup.emotiondiary.dao")
public class MyBatisConfig {
		
	@Bean
	public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
	    SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
	    factoryBean.setDataSource(dataSource);

	    // MyBatis Mapper XML 경로 설정
	    factoryBean.setMapperLocations(new PathMatchingResourcePatternResolver()
	        .getResources("classpath:mapper/*.xml"));

	    return factoryBean.getObject();
	}
	
    @Bean
    public SqlSession sqlSession(SqlSessionFactory sqlSessionFactory) {
        return new SqlSessionTemplate(sqlSessionFactory);
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
