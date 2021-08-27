package com.example.worldpopulation.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import com.example.worldpopulation.model.Country;
import com.example.worldpopulation.repository.CountryRepository;

@Service
public class CountryService {
    @Autowired
    CountryRepository countryRepository;

    public List<Country> getTop20Countries() {
        return countryRepository.findTop20ByOrderByPopulationDesc();
    }
    public Optional<Country> searchCountry(String name) {
        return countryRepository.findByCountryName(name);
    }
    public List<Country> getAllCountries(Integer pageNo, Integer pageSize, String sortBy)
    {
        Pageable paging = PageRequest.of(pageNo, pageSize, Sort.by(sortBy));

        Page<Country> pagedResult = countryRepository.findAll(paging);

        if(pagedResult.hasContent()) {
            return pagedResult.getContent();
        } else {
            return new ArrayList<Country>();
        }
    }
}
