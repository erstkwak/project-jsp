package notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class NoticeService {
	NoticeDAO noticeDAO;

	public NoticeService() {
		noticeDAO = new NoticeDAO();
	}

	public Map listArticles(Map<String, Integer> pagingMap) {
		Map articlesMap = new HashMap();
		//List<ArticleVO> articlesList = noticeDAO.selectAllArticles(pagingMap);
		List<ArticleVO> noticeArticleList = noticeDAO.selectAllArticles(pagingMap, "y");
		List<ArticleVO> articlesList = noticeDAO.selectAllArticles(pagingMap, "n");
		int totArticles = noticeDAO.selectTotArticles();
		articlesMap.put("noticeArticlesList", noticeArticleList);
		articlesMap.put("articlesList", articlesList);
		articlesMap.put("totArticles", totArticles);
		//articlesMap.put("totArticles", 156);
		return articlesMap;
	}

	public List<ArticleVO> listArticles() {
		List<ArticleVO> articlesList = noticeDAO.selectAllArticles();
		return articlesList;
	}

	public int addArticle(ArticleVO article) {
		return noticeDAO.insertNewArticle(article);
	}

	public ArticleVO viewArticle(int articleNO) {
		ArticleVO article = null;
		article = noticeDAO.selectArticle(articleNO);
		return article;
	}

	public void modArticle(ArticleVO article) {
		noticeDAO.updateArticle(article);
	}

	public List<Integer> removeArticle(int articleNO) {
		List<Integer> articleNOList = noticeDAO.selectRemovedArticles(articleNO);
		noticeDAO.deleteArticle(articleNO);
		return articleNOList;
	}

	public int addReply(ArticleVO article) {
		return noticeDAO.insertNewArticle(article);
	}

}