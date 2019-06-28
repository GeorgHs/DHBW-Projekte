<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="profile" class="models.Profile"/>
<jsp:setProperty name="profile" property="id" value="${id}"/>
<div>
    <div class="chat_carousel">
        <c:forEach items="${profile.follower}" var="profile_partner">
            <jsp:setProperty name="profile_partner" property="chatPartner" value="${profile.id}"/>
            <div class="chat_carousel_person" data-id="${profile_partner.id}">
                <c:if test="${profile_partner.unreadMessages != 0}">
                    <span class="badge badge-danger">${profile_partner.unreadMessages}</span>
                </c:if>
                <img class="profile-image" data-toggle="tooltip" data-placement="top" title="${profile_partner.username}" src="data:image;base64,${profile_partner.profilePicture}">
            </div>
        </c:forEach>
        <c:if test="${profile.follower.isEmpty()}">
            <p>No Followers to chat with</p>
        </c:if>
    </div>
    <hr>
    <div class="chatbox">
        <div class="chat_messages">
        </div>
        <hr>
        <div class="chat_send">
            <div class="input-group mb-3">
                <textarea class="form-control post-textarea" placeholder="Schreib etwas..." aria-describedby="basic-addon1"></textarea>
                <div class="input-group-prepend">
                    <button class="chat_send_button input-group-text"><i class="fas fa-paper-plane"></i></button>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="../js/scripts.js"></script>
<script src="/js/dm.js"></script>
<script src="../js/websockets.js"></script>
