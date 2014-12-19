<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1>Bookmarks</h1>

<table class="table table-condensed">
	<thead>
		<tr>
			<th>Site</th>
			<th>Nome</th>
			<th>Favorito</th>
			<th>RSS</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="category" items="${bookmarks}">
			<tr>
				<td>${category.site.name.content}</td>
				<td>${category.name.content}</td>
				<td>
					<c:choose>
						<c:when test="${bookmarks.contains(category)}">
							Yes (<a href="${pageContext.request.contextPath}/learning/bookmarks/remove/${category.externalId}">Remove</a>)
						</c:when>
						<c:otherwise>
							No (<a href="${pageContext.request.contextPath}/learning/bookmarks/add/${category.externalId}">Add</a>)
						</c:otherwise>
					</c:choose>
				</td>
				<td>
					<a href="${category.rssUrl}" data-toggle="tooltip" title="${category.site.name.content} - ${category.name.content}" data-placement="left">
						<img src="${pageContext.request.contextPath}/image/rss.svg" width="15" height="15" />
					</a>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<script>$(function () {
  $('[data-toggle="tooltip"]').tooltip()
});</script>