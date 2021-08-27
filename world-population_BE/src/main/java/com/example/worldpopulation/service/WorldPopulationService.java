package com.example.worldpopulation.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.worldpopulation.model.WorldPopulation;
import com.example.worldpopulation.repository.WorldPopulationRepository;

@Service
public class WorldPopulationService {
    @Autowired
    WorldPopulationRepository worldPopulationRepository;
    public WorldPopulation getWorldPopulation(){
        return worldPopulationRepository.findAll().get(0);
    }
}
