package com.example.worldpopulation.controller;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.example.worldpopulation.model.Country;
import com.example.worldpopulation.service.CountryService;

@RestController
@RequestMapping("/countries")
public class CountryController {
    @Autowired
    CountryService countryService;

    @GetMapping("/top20")
    public List<Country> getTop20Countries(){
        return countryService.getTop20Countries();
    }

    @GetMapping
    public ResponseEntity<List<Country>> getCountries(
            @RequestParam(defaultValue = "0") Integer pageNo,
            @RequestParam(defaultValue = "10") Integer pageSize,
            @RequestParam(defaultValue = "id") String sortBy)
    {
        List<Country> list = countryService.getAllCountries(pageNo, pageSize, sortBy);

        return new ResponseEntity<List<Country>>(list, new HttpHeaders(), HttpStatus.OK);
    }

    @GetMapping("/search")
    public Country searchMedicine(@RequestParam String query) {
        Optional<Country> country = countryService.searchCountry(query);
        return country.orElse(null);
    }

}
