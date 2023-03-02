package com.ovcos.challenge.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.ovcos.challenge.model.dao.ChallengeDao;
import com.ovcos.challenge.model.vo.Contest;
import com.ovcos.challenge.model.vo.ContestChallenge;
import com.ovcos.challenge.model.vo.EntryList;
import com.ovcos.challenge.model.vo.Local;
import com.ovcos.challenge.model.vo.NEntryList;
import com.ovcos.challenge.model.vo.NormalChallenge;

import static com.ovcos.common.JDBCTemplate.*;

public class ChallengeService {

	public ArrayList<Contest> selectContest() {
		Connection conn = getConnection();
		
		ArrayList<Contest> list = new ChallengeDao().selectContest(conn);
		
		close(conn);
		
		return list;
	}

	public int contestProgressCount(String userId) {
		Connection conn = getConnection();
		
		int contestProgressCount = new ChallengeDao().contestProgressCount(conn, userId);
		
		close(conn);
		
		return contestProgressCount;
	}

	public int contestCompleteCount(String userId) {
		Connection conn = getConnection();
		
		int contestCompleteCount = new ChallengeDao().contestCompleteCount(conn, userId);
		
		close(conn);
		
		return contestCompleteCount;
	}

	public int normalProgressCount(String userId) {
		Connection conn = getConnection();
		
		int normalProgressCount = new ChallengeDao().normalProgressCount(conn, userId);
		
		close(conn);
		
		return normalProgressCount;
		
	}

	public int normalCompleteCount(String userId) {
		Connection conn = getConnection();
		
		int normalCompleteCount = new ChallengeDao().normalCompleteCount(conn, userId);
		
		close(conn);
		
		return normalCompleteCount;
	}

	public ArrayList<ContestChallenge> mainContestList(String userId) {
		Connection conn = getConnection();
		
		ArrayList<ContestChallenge> list1 = new ChallengeDao().mainContestList(conn, userId);
		
		close(conn);
		
		return list1;
	}

	public ArrayList<NormalChallenge> mainNormalList(String userId) {
		Connection conn = getConnection();
		
		ArrayList<NormalChallenge> list2 = new ChallengeDao().mainNormalList(conn, userId);
		
		close(conn);
		
		return list2;
	}

	public ArrayList<ContestChallenge> contestChallengeList(String contestName) {
		Connection conn = getConnection();
		
		ArrayList<ContestChallenge> list = new ChallengeDao().contestChallengeList(conn, contestName);
		
		close(conn);
		
		return list;
	}

	public ArrayList<Local> selectLocalList() {
		Connection conn = getConnection();
		
		ArrayList<Local> list1 = new ChallengeDao().selectLocalList(conn);
		
		close(conn);
		
		return list1;
	}

	public ArrayList<NormalChallenge> normalChallengeList(int local) {
		Connection conn = getConnection();
		
		ArrayList<NormalChallenge> list2 = new ChallengeDao().normalChallengeList(conn, local);
		
		close(conn);
		
		return list2;
	}

	
}
