package test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DogServlet
 */
@WebServlet("/choiceDog")
public class DogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DogServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String[] dog = request.getParameterValues("dog");
		
		PrintWriter out = response.getWriter();
		out.write("고객 이름은 " + name + "이고, 고객 아이디는 "+ id +" 입니다<br>");
		out.write(name +"고객이 좋아하는 강아지 정보는...<br>");
		out.write("<hr>");
		
		for(String ref : dog) {
			System.out.println(ref);
			out.println("`<img src='" + ref + "'/>");
		}

	}

}
