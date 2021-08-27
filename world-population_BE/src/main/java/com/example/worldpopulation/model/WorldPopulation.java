package com.example.worldpopulation.model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class WorldPopulation implements Serializable {
    @Id
    @GeneratedValue
    private Long id;
    private Integer countryCount;
    private Long population;

    public Integer getCountryCount() {
        return countryCount;
    }

    public void setCountryCount(Integer countryCount) {
        this.countryCount = countryCount;
    }

    public Long getPopulation() {
        return population;
    }

    public void setPopulation(Long population) {
        this.population = population;
    }
}
