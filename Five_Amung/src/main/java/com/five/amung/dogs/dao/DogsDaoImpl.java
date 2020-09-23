package com.five.amung.dogs.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DogsDaoImpl implements DogsDao{
	@Autowired
	private SqlSession session;
}
