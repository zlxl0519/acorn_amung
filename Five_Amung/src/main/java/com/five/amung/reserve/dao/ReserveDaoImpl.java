package com.five.amung.reserve.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReserveDaoImpl implements ReserveDao{
	@Autowired
	private SqlSession session;
}
