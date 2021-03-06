package viser.document.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import viser.account.service.User;
import viser.document.service.DocumentPage;
import viser.document.service.ListDocumentService;
import viser.document.service.PageForm;

public class ListDocumentHandler implements CommandHandler {

	private static final String LIST_VIEW = "/WEB-INF/view/settlementMain.jsp";
	
	private ListDocumentService listDocumentService = new ListDocumentService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String cautionPageNoVal = req.getParameter("cautionPageNo");
		String checkWaitPageNoVal = req.getParameter("checkWaitPageNo");
		String checkPageNoVal = req.getParameter("checkPageNo");
		String submitPageNoVal = req.getParameter("sumbitPageNo");
		User user = (User) req.getSession(false).getAttribute("authUser");
		
		int cautionPageNo = 1;
		int checkWaitPageNo = 1;
		int checkPageNo = 1;
		int submitPageNo = 1;
		if(cautionPageNoVal != null){
			cautionPageNo = Integer.parseInt(cautionPageNoVal);
		}
		if(checkWaitPageNoVal != null){
			checkWaitPageNo = Integer.parseInt(checkWaitPageNoVal);
		}
		if(checkPageNoVal != null){
			checkPageNo = Integer.parseInt(checkPageNoVal);
		}
		if(submitPageNoVal != null){
			submitPageNo = Integer.parseInt(submitPageNoVal);
		}
		
		PageForm cautionPage = listDocumentService.getDocumentPage(cautionPageNo, 2);
		PageForm checkWaitPage = listDocumentService.getDocumentPage(checkWaitPageNo, false, user);
		PageForm checkPage = listDocumentService.getDocumentPage(checkPageNo, true, user);
		PageForm submitPage = listDocumentService.getDocumentPage(submitPageNo, user);
		
		DocumentPage documentPage = new DocumentPage(cautionPage, checkWaitPage, checkPage, submitPage);
		
		req.setAttribute("documentPage", documentPage);
		
		return LIST_VIEW;
	}
	
}
