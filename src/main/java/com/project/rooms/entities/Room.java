package com.project.rooms.entities;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import com.project.rooms.entities.Country;

@Entity
@Table(schema="rooms",name="room")
public class Room {

	@Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private Long id;
	
	@ManyToOne
	@JoinColumn(name="ownerid",nullable=false)
	private Owner owner;
	
	@Column(name="name",nullable=false)
	private String name;
	
	@Column(name="url",nullable=false)
	private String url;
	
	@Column(name="description")
	private String description;
	
	@Column(name="guests",nullable=false)
	private int guests;
	
	@Column(name="maxguests")
	private Integer maxGuests;
	
	@Column(name="price")
	private Double price;
	
	@Column(name="pricePerExtra")
	private Double pricePerExtra;
	
	@Column(name="pricePerWeek")
	private Double pricePerWeek;
	
	@Column(name="pricePerMonth")
	private Double pricePerMonth;
	
	@Column(name="squareMetres")
	private Integer squareMetres;
	
	@Column(name="roomType")
	private String roomType;
	
	@Column(name="beds")
	private Integer beds;
	
	@Column(name="bedrooms")
	private Integer bedrooms;
	
	@Column(name="bathrooms")
	private Integer bathrooms;
	
	@Column(name="thumbnail")
	private String thumbnail;
	
	@Column(name="defaultPic")
	private String defaultPic;
	
	@Column(name="floor")
	private String floor;
	
	@Column(name="neighborhoodOverview")
	private String neighborhood;
	
	@Column(name="address")
	private String address;
	
	@Column(name="postalCode")
	private String postalCode;
	
	@Column(name="city")
	private String city;
	
	@Column(name="state")
	private String state;
	
	@ManyToOne
	@JoinColumn(name="country")
	private Country country;
	
	@Column(name="transport")
	private String transport;
	
	@Column(name="amenities")
	private String amenities;
	
	@Column(name="rules")
	private String rules;
	
	@Column(name="reviews")
	private Integer reviews;
	
	@Column(name="reviewAvg")
	private Double reviewAvg;
	
	protected Room(){}

	protected Room(Long id, Owner owner, String name, String url, String description, int guests, Integer maxGuests,
			Double price, Double pricePerExtra, Double pricePerWeek, Double pricePerMonth, Integer squareMetres,
			String roomType, Integer beds, Integer bedrooms, Integer bathrooms, String thumbnail, String defaultPic,
			String floor, String neighborhood, String address, String postalCode, String city, String state,
			Country country, String transport, String amenities, String rules) {
		super();
		this.id = id;
		this.owner = owner;
		this.name = name;
		this.url = url;
		this.description = description;
		this.guests = guests;
		this.maxGuests = maxGuests;
		this.price = price;
		this.pricePerExtra = pricePerExtra;
		this.pricePerWeek = pricePerWeek;
		this.pricePerMonth = pricePerMonth;
		this.squareMetres = squareMetres;
		this.roomType = roomType;
		this.beds = beds;
		this.bedrooms = bedrooms;
		this.bathrooms = bathrooms;
		this.thumbnail = thumbnail;
		this.defaultPic = defaultPic;
		this.floor = floor;
		this.neighborhood = neighborhood;
		this.address = address;
		this.postalCode = postalCode;
		this.city = city;
		this.state = state;
		this.country = country;
		this.transport = transport;
		this.amenities = amenities;
		this.rules = rules;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Owner getOwner() {
		return owner;
	}

	public void setOwner(Owner owner) {
		this.owner = owner;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getGuests() {
		return guests;
	}

	public void setGuests(int guests) {
		this.guests = guests;
	}

	public Integer getMaxGuests() {
		return maxGuests;
	}

	public void setMaxGuests(Integer maxGuests) {
		this.maxGuests = maxGuests;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Double getPricePerExtra() {
		return pricePerExtra;
	}

	public void setPricePerExtra(Double pricePerExtra) {
		this.pricePerExtra = pricePerExtra;
	}

	public Double getPricePerWeek() {
		return pricePerWeek;
	}

	public void setPricePerWeek(Double pricePerWeek) {
		this.pricePerWeek = pricePerWeek;
	}

	public Double getPricePerMonth() {
		return pricePerMonth;
	}

	public void setPricePerMonth(Double pricePerMonth) {
		this.pricePerMonth = pricePerMonth;
	}

	public Integer getSquareMetres() {
		return squareMetres;
	}

	public void setSquareMeters(Integer squareMetres) {
		this.squareMetres = squareMetres;
	}

	public String getRoomType() {
		return roomType;
	}

	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}

	public Integer getBeds() {
		return beds;
	}

	public void setBeds(Integer beds) {
		this.beds = beds;
	}

	public Integer getBedrooms() {
		return bedrooms;
	}

	public void setBedrooms(Integer bedrooms) {
		this.bedrooms = bedrooms;
	}

	public Integer getBathrooms() {
		return bathrooms;
	}

	public void setBathrooms(Integer bathrooms) {
		this.bathrooms = bathrooms;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getDefaultPic() {
		return defaultPic;
	}

	public void setDefaultPic(String defaultPic) {
		this.defaultPic = defaultPic;
	}

	public String getFloor() {
		return floor;
	}

	public void setFloor(String floor) {
		this.floor = floor;
	}

	public String getNeighborhood() {
		return neighborhood;
	}

	public void setNeighborhood(String neighborhood) {
		this.neighborhood = neighborhood;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Country getCountry() {
		return country;
	}

	public void setCountry(Country country) {
		this.country = country;
	}

	public String getTransport() {
		return transport;
	}

	public void setTransport(String transport) {
		this.transport = transport;
	}

	public String getAmenities() {
		return amenities;
	}

	public void setAmenities(String amenities) {
		this.amenities = amenities;
	}

	public String getRules() {
		return rules;
	}

	public void setRules(String rules) {
		this.rules = rules;
	}

	public Integer getReviews() {
		return reviews;
	}

	public void setReviews(Integer reviews) {
		this.reviews = reviews;
	}

	public Double getReviewAvg() {
		return reviewAvg;
	}

	public void setReviewAvg(Double reviewAvg) {
		this.reviewAvg = reviewAvg;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((address == null) ? 0 : address.hashCode());
		result = prime * result + ((amenities == null) ? 0 : amenities.hashCode());
		result = prime * result + ((bathrooms == null) ? 0 : bathrooms.hashCode());
		result = prime * result + ((bedrooms == null) ? 0 : bedrooms.hashCode());
		result = prime * result + ((beds == null) ? 0 : beds.hashCode());
		result = prime * result + ((city == null) ? 0 : city.hashCode());
		result = prime * result + ((country == null) ? 0 : country.hashCode());
		result = prime * result + ((defaultPic == null) ? 0 : defaultPic.hashCode());
		result = prime * result + ((description == null) ? 0 : description.hashCode());
		result = prime * result + ((floor == null) ? 0 : floor.hashCode());
		result = prime * result + guests;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((maxGuests == null) ? 0 : maxGuests.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((neighborhood == null) ? 0 : neighborhood.hashCode());
		result = prime * result + ((owner == null) ? 0 : owner.hashCode());
		result = prime * result + ((postalCode == null) ? 0 : postalCode.hashCode());
		result = prime * result + ((price == null) ? 0 : price.hashCode());
		result = prime * result + ((pricePerExtra == null) ? 0 : pricePerExtra.hashCode());
		result = prime * result + ((pricePerMonth == null) ? 0 : pricePerMonth.hashCode());
		result = prime * result + ((pricePerWeek == null) ? 0 : pricePerWeek.hashCode());
		result = prime * result + ((reviewAvg == null) ? 0 : reviewAvg.hashCode());
		result = prime * result + ((reviews == null) ? 0 : reviews.hashCode());
		result = prime * result + ((roomType == null) ? 0 : roomType.hashCode());
		result = prime * result + ((rules == null) ? 0 : rules.hashCode());
		result = prime * result + ((squareMetres == null) ? 0 : squareMetres.hashCode());
		result = prime * result + ((state == null) ? 0 : state.hashCode());
		result = prime * result + ((thumbnail == null) ? 0 : thumbnail.hashCode());
		result = prime * result + ((transport == null) ? 0 : transport.hashCode());
		result = prime * result + ((url == null) ? 0 : url.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Room other = (Room) obj;
		if (address == null) {
			if (other.address != null)
				return false;
		} else if (!address.equals(other.address))
			return false;
		if (amenities == null) {
			if (other.amenities != null)
				return false;
		} else if (!amenities.equals(other.amenities))
			return false;
		if (bathrooms == null) {
			if (other.bathrooms != null)
				return false;
		} else if (!bathrooms.equals(other.bathrooms))
			return false;
		if (bedrooms == null) {
			if (other.bedrooms != null)
				return false;
		} else if (!bedrooms.equals(other.bedrooms))
			return false;
		if (beds == null) {
			if (other.beds != null)
				return false;
		} else if (!beds.equals(other.beds))
			return false;
		if (city == null) {
			if (other.city != null)
				return false;
		} else if (!city.equals(other.city))
			return false;
		if (country == null) {
			if (other.country != null)
				return false;
		} else if (!country.equals(other.country))
			return false;
		if (defaultPic == null) {
			if (other.defaultPic != null)
				return false;
		} else if (!defaultPic.equals(other.defaultPic))
			return false;
		if (description == null) {
			if (other.description != null)
				return false;
		} else if (!description.equals(other.description))
			return false;
		if (floor == null) {
			if (other.floor != null)
				return false;
		} else if (!floor.equals(other.floor))
			return false;
		if (guests != other.guests)
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (maxGuests == null) {
			if (other.maxGuests != null)
				return false;
		} else if (!maxGuests.equals(other.maxGuests))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (neighborhood == null) {
			if (other.neighborhood != null)
				return false;
		} else if (!neighborhood.equals(other.neighborhood))
			return false;
		if (owner == null) {
			if (other.owner != null)
				return false;
		} else if (!owner.equals(other.owner))
			return false;
		if (postalCode == null) {
			if (other.postalCode != null)
				return false;
		} else if (!postalCode.equals(other.postalCode))
			return false;
		if (price == null) {
			if (other.price != null)
				return false;
		} else if (!price.equals(other.price))
			return false;
		if (pricePerExtra == null) {
			if (other.pricePerExtra != null)
				return false;
		} else if (!pricePerExtra.equals(other.pricePerExtra))
			return false;
		if (pricePerMonth == null) {
			if (other.pricePerMonth != null)
				return false;
		} else if (!pricePerMonth.equals(other.pricePerMonth))
			return false;
		if (pricePerWeek == null) {
			if (other.pricePerWeek != null)
				return false;
		} else if (!pricePerWeek.equals(other.pricePerWeek))
			return false;
		if (reviewAvg == null) {
			if (other.reviewAvg != null)
				return false;
		} else if (!reviewAvg.equals(other.reviewAvg))
			return false;
		if (reviews == null) {
			if (other.reviews != null)
				return false;
		} else if (!reviews.equals(other.reviews))
			return false;
		if (roomType == null) {
			if (other.roomType != null)
				return false;
		} else if (!roomType.equals(other.roomType))
			return false;
		if (rules == null) {
			if (other.rules != null)
				return false;
		} else if (!rules.equals(other.rules))
			return false;
		if (squareMetres == null) {
			if (other.squareMetres != null)
				return false;
		} else if (!squareMetres.equals(other.squareMetres))
			return false;
		if (state == null) {
			if (other.state != null)
				return false;
		} else if (!state.equals(other.state))
			return false;
		if (thumbnail == null) {
			if (other.thumbnail != null)
				return false;
		} else if (!thumbnail.equals(other.thumbnail))
			return false;
		if (transport == null) {
			if (other.transport != null)
				return false;
		} else if (!transport.equals(other.transport))
			return false;
		if (url == null) {
			if (other.url != null)
				return false;
		} else if (!url.equals(other.url))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Room [id=" + id + ", owner=" + owner + ", name=" + name + ", url=" + url + ", description="
				+ description + ", guests=" + guests + ", maxGuests=" + maxGuests + ", price=" + price
				+ ", pricePerExtra=" + pricePerExtra + ", pricePerWeek=" + pricePerWeek + ", pricePerMonth="
				+ pricePerMonth + ", squareMetres=" + squareMetres + ", roomType=" + roomType + ", beds=" + beds
				+ ", bedrooms=" + bedrooms + ", bathrooms=" + bathrooms + ", thumbnail=" + thumbnail + ", defaultPic="
				+ defaultPic + ", floor=" + floor + ", neighborhood=" + neighborhood + ", address=" + address
				+ ", postalCode=" + postalCode + ", city=" + city + ", state=" + state + ", country=" + country
				+ ", transport=" + transport + ", amenities=" + amenities + ", rules=" + rules + ", reviews=" + reviews
				+ ", reviewAvg=" + reviewAvg + "]";
	}
	
	
	
	
}
