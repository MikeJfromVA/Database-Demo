package mybatis;
import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisDemo {
	public static void main(String[] args) {
		String resource = "mybatis-config.xml";
		InputStream inputStream;
		try {
			inputStream = Resources.getResourceAsStream(resource);
		} catch (IOException e) {
			System.err.println("Cannot open MyBatis configuration file");
			System.err.println(e.getMessage());
			return;
		}
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder()
				.build(inputStream);

		SqlSession session = sqlSessionFactory.openSession();
		try {
			Product product = session.selectOne("ProductMapper.selectProduct",
					"11QER/31");
			System.out.println(product.p_code);
			System.out.println(product.p_descript);
			System.out.println(product.p_qoh);
			System.out.println(product.p_min);
			System.out.println(product.p_price);
			System.out.println(product.p_discount);
		} finally {
			session.close();
		}
	}
}
