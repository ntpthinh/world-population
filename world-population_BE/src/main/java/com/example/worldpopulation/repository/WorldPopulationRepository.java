package com.example.worldpopulation.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.example.worldpopulation.model.WorldPopulation;
@Repository
public interface WorldPopulationRepository extends JpaRepository<WorldPopulation, Long> {
}
