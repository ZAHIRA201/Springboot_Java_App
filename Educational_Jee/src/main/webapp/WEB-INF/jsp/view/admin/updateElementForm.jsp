<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="../fragments/adminHeader.jsp" />

<div class="container">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <jsp:include page="../fragments/menu.jsp" />
        </div>
    </nav>

    <div>
        <h3>Mise à jour d'un Element Pédagogique</h3>
    </div>
    <div>
        <c:if test="${not empty msg}">
            <div class="alert alert-success" role="alert">${msg}</div>
        </c:if>

        <f:form action="${pageContext.request.contextPath}/admin/updateElement" method="POST" modelAttribute="elementModel">
            <f:hidden path="idElement" />
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

            <div class="row">
                <div class="col">
                    <label>Nome de la matière pédagogique</label>
                    <f:input path="titre" type="text" class="form-control" placeholder="nom de la matière" />
                    <f:errors path="titre" class="text-danger" />
                </div>

                <div class="col">
                    <label>Type Element</label>
				    <div class="form-check">
				        <input type="radio" id="module" name="typeElement" value="module" class="form-check-input" />
				        <label class="form-check-label" for="module">Module</label>
				    </div>
				    <div class="form-check">
				    	<input type="radio" id="element" name="typeElement" value="element" class="form-check-input" />
				        <label class="form-check-label" for="element">Element</label>
				    </div>
                    <f:errors path="typeElement" class="text-danger" />
                </div>
            </div>

            <div class="row">
                <div class="col">
				    <label>Niveau</label>
				    <f:select path="niveau" class="form-control">
				        <f:option value="" label="Sélectionner un Niveau" />
				        <f:option value="AP1" label="Année Préparatoire 1" />
				        <f:option value="AP2" label="Année Préparatoire 2" />
				        <f:option value="ID1" label="Igénierie de Données 1" />
				        <f:option value="ID2" label="Igénierie de Données 2" />
				        <f:option value="GI2" label="Génie Informatique 2" />
				    </f:select>
				    <f:errors path="niveau" class="text-danger" />
				</div>
                
                <div class="col">
                    <label>Enseignant</label>
                    <f:select path="idPersonne" class="form-control">
                       "" <f:option value="" label="Sélectionner un Enseignant" />
                        <c:forEach items="${enseignants}" var="enseignant">
                            <f:option value="${enseignant.idPersonne}" label="${enseignant.nom}" />
                        </c:forEach>
                    </f:select>
                    <f:errors path="idPersonne" class="text-danger" />
                </div>
            </div>

            <div style="text-align: right">
                <button type="submit" class="btn btn-primary">Update</button>
                <button type="reset" class="btn btn-secondary">Reset</button>
            </div>
        </f:form>
    </div>

    <jsp:include page="../fragments/adminfooter.jsp" />
</div>
