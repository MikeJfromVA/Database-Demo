package mybatis;
import java.util.Arrays;

public class Address {
	private String streetAddress;
	private String city;
	private int zip;
	private char[] state;

	public Address(String streetAddress, String city, int zip, char[] state) {
		if (streetAddress == null || city == null || state == null)
			throw new IllegalArgumentException();
		this.streetAddress = streetAddress;
		this.city = city;
		this.zip = zip;
		this.state = state;
	}

	public Address(String streetAddress, String city, int zip, String state) {
		if (streetAddress == null || city == null || state == null)
			throw new IllegalArgumentException();
		this.streetAddress = streetAddress;
		this.city = city;
		this.zip = zip;
		this.state = state.toCharArray();
	}

	public String getStreetAddress() {
		return streetAddress;
	}

	public String getCity() {
		return city;
	}

	public int getZip() {
		return zip;
	}

	public char[] getState() {
		return Arrays.copyOf(state, 2);
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + city.hashCode();
		result = prime * result + Arrays.hashCode(state);
		result = prime * result + streetAddress.hashCode();
		result = prime * result + zip;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (!(obj instanceof Address))
			return false;
		Address other = (Address) obj;
		return (city.equals(other.city)
				&& streetAddress.equals(other.streetAddress)
				&& zip == other.zip && state[0] == other.state[0] && state[1] == other.state[1]);
	}

	@Override
	public String toString() {
		// \n works as EOL everywhere
		return streetAddress + "\n" + city + " " + new String(state) + " "
				+ zip + "\n";
	}
}
