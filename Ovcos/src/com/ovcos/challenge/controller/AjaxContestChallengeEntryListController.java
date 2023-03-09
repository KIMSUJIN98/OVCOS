package com.ovcos.challenge.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.ovcos.challenge.model.service.ChallengeService;
import com.ovcos.challenge.model.vo.EntryList;

/**
 * Servlet implementation class AjaxContestChallengeEntryListController
 */
@WebServlet("/entryList.ch")
public class AjaxContestChallengeEntryListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxContestChallengeEntryListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int contestChallengeNo = Integer.parseInt(request.getParameter("contestChallengeNo"));
		
		ArrayList<EntryList> eList = new ChallengeService().selectEntryList(contestChallengeNo);
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(eList, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
