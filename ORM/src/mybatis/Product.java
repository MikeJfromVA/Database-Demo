package mybatis;
import java.util.Date;

public class Product {
	public String p_code;
	public String p_descript;
	public Date p_indate; // Type mapping is impressive
	public int p_qoh;
	public int p_min;
	public double p_price; // Wrong. Numeric (8,2) is precise, double is IMPRECISE
	public double p_discount; // Wrong. Numeric (5,2) is precise, double is IMPRECISE
}
