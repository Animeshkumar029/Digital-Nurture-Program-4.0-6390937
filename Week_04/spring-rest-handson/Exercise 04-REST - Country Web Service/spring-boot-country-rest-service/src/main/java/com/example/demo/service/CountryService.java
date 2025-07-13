package com.example.demo.service;

import com.example.demo.model.Country;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CountryService {
    private final List<Country> countries = new ArrayList<>();

    public CountryService() {
        countries.add(new Country("India", "New Delhi", 1400000000));
        countries.add(new Country("USA", "Washington, D.C.", 331000000));
        countries.add(new Country("Japan", "Tokyo", 125800000));
    }

    public List<Country> getAllCountries() {
        return countries;
    }

    public Country getCountryByName(String name) {
        return countries.stream()
                .filter(c -> c.getName().equalsIgnoreCase(name))
                .findFirst()
                .orElse(null);
    }
}
