package com.example.countryapi;

public class Country {
    private String code;
    private String name;
    private String capital;
    private String region;

    public Country(String code, String name, String capital, String region) {
        this.code = code;
        this.name = name;
        this.capital = capital;
        this.region = region;
    }

    public String getCode() { return code; }
    public String getName() { return name; }
    public String getCapital() { return capital; }
    public String getRegion() { return region; }
}
