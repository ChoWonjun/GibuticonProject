package org.kosta.gibuticon.model.point;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
@Repository
public class PointDAOImpl {
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
}
