<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="page-header clearfix">
       <h2 class="pull-left">
               Últimas Novidades
       </h2>
       <div class="pull-right">
               Nº de posts
               <div class="btn-group">
                       <a href="?posts=5" class="btn btn-default ${posts == 5 ? 'active' : ''}">5</a>
                       <a href="?posts=10" class="btn btn-default ${posts == 10 ? 'active' : ''}">10</a>
                       <a href="?posts=20" class="btn btn-default ${posts == 20 ? 'active' : ''}">20</a>
               </div>
       </div>
</div>

<c:forEach var="post" items="${allPosts}">
       <div class="panel panel-default">
               <div class="panel-body clearfix">
                       <h3 class="panel-title pull-left">
                               <strong><a href="${pageContext.request.contextPath}/cms/news/${post.site.slug}/${post.slug}">${post.name.content}</a></strong>
                       </h3>
                       <small class="pull-right">
                               <em>
                                       Publicado em ${post.creationDate.toString('dd-MM-YYYY')}
                                               <c:if test="${post.modified}">
                                                       - Modificado em ${post.modificationDate.toString('dd-MM-YYYY')}
                                               </c:if>
                               </em>
                       </small>
               </div>
               <div class="panel-body">
                       <div>${post.body.content}</div>
                       <p class="text-right" style="margin: 0">
							<small>
								<em>
									<c:if test="${not empty post.createdBy}">
									${post.createdBy.profile.displayName} -
									</c:if>

									<a href="${post.site.fullUrl}" target="_blank">
										${post.site.name.content} - ${post.categoriesString}
									</a>
								</em>
							</small>
                       </p>
               </div>
       </div>
</c:forEach>

<style>.page-header,.page-header>h2{margin-top:0px;}</style>