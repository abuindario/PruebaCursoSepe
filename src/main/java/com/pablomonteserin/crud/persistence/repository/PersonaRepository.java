package com.pablomonteserin.crud.persistence.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.pablomonteserin.crud.persistence.model.Persona;


public interface PersonaRepository extends CrudRepository<Persona, Integer> {
    List<Persona> findAll();

}
