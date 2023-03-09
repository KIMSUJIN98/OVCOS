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
import com.ovcos.upload.model.vo.ImageUpload;

import static com.ovcos.common.JDBCTemplate.*;

public class ChallengeService {

	public ArrayList<Contest> selectContestList() {
		Connection conn = getConnection();
		
		ArrayList<Contest> list = new ChallengeDao().selectContestList(conn);
		
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

	public ArrayList<ContestChallenge> contestChallengeList(int contestNo) {
		Connection conn = getConnection();
		
		ArrayList<ContestChallenge> list = new ChallengeDao().contestChallengeList(conn, contestNo);
		
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

	public int insertContest(Contest c, ImageUpload img) {
		Connection conn = getConnection();
		
		int result = new ChallengeDao().insertContest(conn, c);
				
		int result2 = new ChallengeDao().insertContestImg(conn, img);
		
		if(result * result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result * result2;
	}

	public int deleteContest(int contestNo) {
		Connection conn = getConnection();
		int result = new ChallengeDao().deleteContest(conn, contestNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int insertContestChallenge(ContestChallenge cc, ImageUpload img) {
		Connection conn = getConnection();
		
		int result1 = new ChallengeDao().insertContestChallenge(conn, cc);
		int result2 = 1;
		int result3 = new ChallengeDao().insertEntryListSelf(conn, cc);
				
		if(img != null) {
			result2 = new ChallengeDao().insertContestChallengeImg(conn, cc, img);
		}
		
		if(result1 * result2 * result3 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2 * result3;
	}

	public Contest selectContest(int contestNo) {
		Connection conn = getConnection();
	
		Contest c = new ChallengeDao().selectContest(conn, contestNo);
		
		close(conn);
		
		return c;
	}

	public int deleteContestChallenge(int contestChallengeNo) {
		Connection conn = getConnection();
		int result = new ChallengeDao().deleteContestChallenge(conn, contestChallengeNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}

	public int insertEntryList(EntryList el) {
		Connection conn = getConnection();
		
		int result = new ChallengeDao().insertEntryList(conn, el);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public ArrayList<EntryList> selectEntryList(int contestChallengeNo) {
		Connection conn = getConnection();
		
		ArrayList<EntryList> list = new ChallengeDao().selectEntryList(conn, contestChallengeNo);
		
		close(conn);
		
		return list;
	
	}

	public int deleteEntryList(EntryList el) {
		Connection conn = getConnection();
		
		int result = new ChallengeDao().deleteEntryList(conn, el);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int checkEntryId(EntryList el) {
		Connection conn = getConnection();
		
		ArrayList<EntryList> list = new ChallengeDao().checkEntryId(conn, el);
		
		int result = 0;
		
		if(list == null || list.isEmpty()) {
			result = 0;
		} else {
			result = 1;
		}
		
		close(conn);
		
		return result;
	}

	public int insertNormalChallenge(NormalChallenge nc, ImageUpload img) {
		Connection conn = getConnection();
		
		int result1 = new ChallengeDao().insertNormalChallenge(conn, nc);
		System.out.println(result1);
		int result2 = 1;
		int result3 = new ChallengeDao().insertNEntryListSelf(conn, nc);
				
		if(img != null) {
			result2 = new ChallengeDao().insertNormalChallengeImg(conn, nc, img);
		}
		
		if(result1 * result2 * result3 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2 * result3;
		
	}

	public int checkNEntryId(NEntryList nel) {
		Connection conn = getConnection();
		
		ArrayList<NEntryList> list = new ChallengeDao().checkNEntryId(conn, nel);
		
		int result = 0;
		
		if(list == null || list.isEmpty()) {
			result = 0;
		} else {
			result = 1;
		}
		
		close(conn);
		
		return result;
	}

	public int insertNEntryList(NEntryList nel) {
		Connection conn = getConnection();
		
		int result = new ChallengeDao().insertNEntryList(conn, nel);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int deleteNEntryList(NEntryList nel) {
		Connection conn = getConnection();
		
		int result = new ChallengeDao().deleteNEntryList(conn, nel);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}

	public ArrayList<NEntryList> selectNEntryList(int normalChallengeNo) {
		Connection conn = getConnection();
		
		ArrayList<NEntryList> list = new ChallengeDao().selectNEntryList(conn, normalChallengeNo);
		
		close(conn);
		
		return list;
	}

	public int deleteNormalChallenge(int normalChallengeNo) {
		Connection conn = getConnection();
		int result = new ChallengeDao().deleteNormalChallenge(conn, normalChallengeNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}

	public ArrayList<NormalChallenge> selectLocalView(int localNo) {
		Connection conn = getConnection();
		
		ArrayList<NormalChallenge> list = new ChallengeDao().selectLocalView(conn, localNo);
		
		close(conn);
		
		return list;
		
		
	}
	



	
}
