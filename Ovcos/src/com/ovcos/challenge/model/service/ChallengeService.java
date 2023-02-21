package com.ovcos.challenge.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.ovcos.challenge.model.dao.ChallengeDao;
import com.ovcos.challenge.model.vo.Contest;
import static com.ovcos.common.JDBCTemplate.*;

public class ChallengeService {

	public ArrayList<Contest> selectContest() {
		Connection conn = getConnection();
		
		ArrayList<Contest> list = new ChallengeDao().selectContest(conn);
		
		close(conn);
		
		return list;
	}
	
}
