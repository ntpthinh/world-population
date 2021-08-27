package com.example.worldpopulation.repository;

import java.util.List;
import java.util.Optional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;
import com.example.worldpopulation.model.Country;

@Repository
public interface CountryRepository extends PagingAndSortingRepository<Country, Long> {
    List<Country> findTop20ByOrderByPopulationDesc();
    Page<Country> findAll(Pageable pageable);
    Optional<Country> findByCountryName(String name);

}
