package com.example.countryapi;

import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;

@RestController
@RequestMapping("/api/country")
public class CountryController {

    private final List<Country> countries = Arrays.asList(
        new Country("IN", "India", "New Delhi", "Asia"),
        new Country("US", "United States", "Washington, D.C.", "Americas"),
        new Country("FR", "France", "Paris", "Europe")
    );

    @GetMapping("/{code}")
    public Country getCountryByCode(@PathVariable String code) {
        return countries.stream()
                .filter(c -> c.getCode().equalsIgnoreCase(code))
                .findFirst()
                .orElseThrow(() -> new RuntimeException("Country not found"));
    }
}
