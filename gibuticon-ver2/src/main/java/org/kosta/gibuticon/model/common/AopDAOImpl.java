package org.kosta.gibuticon.model.common;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class AopDAOImpl implements AopDAO {
	
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

}
