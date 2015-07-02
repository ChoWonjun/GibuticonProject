package org.kosta.gibuticon.model.service;

import javax.annotation.Resource;

import org.kosta.gibuticon.model.common.AopDAO;
import org.springframework.stereotype.Service;

@Service
public class AopServiceImpl implements AopService {
	
	@Resource
	private AopDAO aopDAO;
}
