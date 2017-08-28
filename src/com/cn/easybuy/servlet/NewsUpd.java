package com.cn.easybuy.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cn.easybuy.dao.NewsDao;
import com.cn.easybuy.dao.impl.NewsDaoImpl;
import com.cn.easybuy.entity.News;

/**
 * Servlet implementation class NewsUpd
 */

public class NewsUpd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewsUpd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8"); 

		String id=request.getParameter("id");
		int ids=Integer.valueOf(id);
		String title="";
		if(request.getParameter("title")!=null)
		{
			title=request.getParameter("title");
		} 
		String content="";
		if(request.getParameter("content")!=null)
		{
			content=request.getParameter("content");
		} 
		 NewsDao newsdao= new NewsDaoImpl();
		 News news=new News();
		 news.setId(ids);
		 news.setTitle(title);
		 news.setContent(content);
		 
		 boolean result=newsdao.updatenews(news);
			if(result=true){
				request.getSession().removeAttribute("pages1");
				response.sendRedirect("manage-result.jsp");
			}
			else{
				request.getRequestDispatcher("news-modify.jsp").forward(request, response);
			}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
