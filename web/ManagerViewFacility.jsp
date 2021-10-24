<%-- 
    Document   : ManagerViewFacility
    Created on : Sep 27, 2021, 4:29:22 PM
    Author     : Admin
--%>

<%@page import="java.util.List"%>
<%@page import="app.facility.FacilityDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Manager Page</title>

        <!-- Popins Font -->
        <link
            href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700;800&display=swap"
            rel="stylesheet"
            />

        <!-- ion Icon -->
        <script
            type="module"
            src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"
        ></script>
        <script
            nomodule
            src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"
        ></script>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminPage1.css" />
    </head>
    <body>

        <div class="user-form ${requestScope.edit_flag}">
            <div class="modal">
                <div class="user-form-main">
                    <form action="UpdateUserController" class="user-form-actual-form" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="position" value="${requestScope.position}"/>
                        <div class="actual-form-heading">
                            <div class="avatar-wrap">
                                <c:set var="image" value="${requestScope.USER_UPDATE.image}"/>
                                <c:choose>
                                    <c:when test="${fn:startsWith(image, 'http')}">
                                        <img
                                            src="${requestScope.USER_UPDATE.image}"
                                            alt=""
                                            class="avatar"
                                            />
                                    </c:when>
                                    <c:otherwise>
                                        <img
                                            src="data:image/jpg/png;base64,${requestScope.USER_UPDATE.image}"
                                            alt=""
                                            class="avatar"
                                            />
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="input-file-wrap">
                                <label>
                                    <ion-icon
                                        name="image-outline"
                                        class="input-file-select actual-form-heading-image"
                                        ></ion-icon>
                                    <input
                                        type="file"
                                        name="image"
                                        id="image"
                                        style="display: none"
                                        />
                                </label>
                            </div>
                        </div>
                        <div class="actual-form-content">
                            <div class="actual-form-input-wrapper">
                                <div class="input-wrap">
                                    <input
                                        type="text"
                                        name="userName"
                                        id="userName"
                                        value="${requestScope.USER_UPDATE.email}"
                                        readonly
                                        />
                                    <label>User Name</label>
                                </div>
                                <div class="input-wrap">
                                    <input
                                        type="email"
                                        name="email"
                                        id="email"
                                        value="${requestScope.USER_UPDATE.email}"
                                        readonly
                                        />
                                    <label>Email</label>
                                </div>
                                <div class="input-wrap">
                                    <input
                                        type="text"
                                        name="roleID"
                                        id="roleID"
                                        value="${requestScope.USER_UPDATE.roleID}"
                                        readonly
                                        />
                                    <label>Role</label>
                                </div>
                            </div>
                            <div class="actual-form-input-wrapper">
                                <div class="input-wrap">
                                    <input
                                        type="text"
                                        name="statusID"
                                        id="statusID"
                                        value="${requestScope.USER_UPDATE.statusID}"
                                        readonly
                                        />
                                    <label>Status</label>
                                </div>
                                <div class="input-wrap">
                                    <input
                                        type="password"
                                        name="password"
                                        id="password"
                                        value="${requestScope.USER_UPDATE.password}"
                                        />
                                    <label>Password</label>
                                </div>
                                <div class="input-wrap">
                                    <input
                                        type="text"
                                        name="fullName"
                                        id="fullName"
                                        value="${requestScope.USER_UPDATE.fullName}"
                                        placeholder="Enter full name ..."
                                        />
                                    <label>Full Name</label>
                                </div>
                            </div>
                        </div>
                        <div class="actual-form-footer">
                            <button type="submit" class="actual-form-footer-btn done">
                                <ion-icon name="checkmark-circle-outline"></ion-icon>
                            </button>
                        </div>
                        <input type="hidden" name="userID" value="${requestScope.USER_UPDATE.userID}"/>
                    </form>
                </div>
            </div>
        </div>

        <main>
            <section class="showcase">
                <div class="container">
                    <div class="showcase-main">
                        <div class="showcase-header">
                            <div class="showcase-logo">
                                <a href="ShowFacilitiesController">
                                    <img
                                        src="https://cdn.discordapp.com/attachments/770804043794350100/888843339439407104/toolkit.png"
                                        alt=""
                                        />
                                </a>
                            </div>
                            <ul class="showcase-menu">
                                <!-- In those has 3 icon for 3 Page -->
                                <!-- If you want to icon is highlight you have to add class active for li[class = 'showcase-item'] -->
                                <li class="showcase-item" data-index="0">
                                    <a href="ShowFeedBackController" class="showcase-link">
                                        <ion-icon
                                            name="document-text-outline"
                                            class="no-active-mode"
                                            ></ion-icon>
                                        <ion-icon
                                            name="document-text"
                                            class="active-mode"
                                            ></ion-icon>
                                    </a>
                                    <span></span>
                                </li>
                                <li class="showcase-item" data-index="1">
                                    <a href="ShowUserController" class="showcase-link">
                                        <ion-icon
                                            name="people-outline"
                                            class="no-active-mode"
                                            ></ion-icon>
                                        <ion-icon name="people" class="active-mode"></ion-icon>
                                    </a>
                                    <span></span>
                                </li>
                                <li class="showcase-item active" data-index="2">
                                    <a href="ShowFacilitiesController" class="showcase-link">
                                        <ion-icon
                                            name="hammer-outline"
                                            class="no-active-mode"
                                            ></ion-icon>
                                        <ion-icon name="hammer" class="active-mode"></ion-icon>
                                    </a>
                                    <span></span>
                                </li>
                                <li class="showcase-item" data-index="3">
                                    <a href="FacilityStatisticController" class="showcase-link">
                                        <ion-icon
                                            name="stats-chart-outline"
                                            class="no-active-mode"
                                            ></ion-icon>
                                        <ion-icon name="stats-chart" class="active-mode"></ion-icon>
                                    </a>
                                    <span></span>
                                </li>
                                <li
                                    class="showcase-item active showcase-item-dropdown-select"
                                    data-index="3"
                                    >
                                    <a href="#" class="showcase-link">
                                        <ion-icon
                                            name="notifications-outline"
                                            class="no-active-mode"
                                            ></ion-icon>
                                        <ion-icon
                                            name="notifications"
                                            class="active-mode"
                                            ></ion-icon>
                                    </a>
                                    <span></span>
                                    <div class="showcase-item-dropdown-list">
                                        <h4 class="showcase-item-dropdown-title">Notification</h4>
                                        <h5 class="showcase-item-dropdown-sub-title">
                                            You have 2 new feedback
                                        </h5>
                                        <!-- <h5 class="showcase-item-dropdown-sub-title sub-title-no">
                                          No notification can be found ...
                                        </h5> -->
                                        <div class="pipe-list">
                                            <div class="notification-item">
                                                <div class="pipe-item-heading">
                                                    <div class="pipe-item-title-wrapper">
                                                        <h3 class="pipe-item-title">Feedback #1</h3>
                                                        <p class="pipe-item-desc">
                                                            <strong>Name:</strong> Nguyen Duong Minh duc
                                                        </p>
                                                    </div>
                                                    <div class="pipe-item-date">Tue, August 18</div>
                                                </div>
                                                <div class="pipe-item-bottom">
                                                    <p class="pipe-bottom-item">
                                                        <strong>Send by</strong>
                                                        ducndmse151198@fpt.edu.vn
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="notification-item">
                                                <div class="pipe-item-heading">
                                                    <div class="pipe-item-title-wrapper">
                                                        <h3 class="pipe-item-title">Feedback #1</h3>
                                                        <p class="pipe-item-desc">
                                                            <strong>Name:</strong> Nguyen Duong Minh duc
                                                        </p>
                                                    </div>
                                                    <div class="pipe-item-date">Tue, August 18</div>
                                                </div>
                                                <div class="pipe-item-bottom">
                                                    <p class="pipe-bottom-item">
                                                        <strong>Send by</strong>
                                                        ducndmse151198@fpt.edu.vn
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div
                                        class="showcase-item-dropdown-actual-notification active"
                                        >
                                        2
                                    </div>
                                </li>
                            </ul>
                            <div class="showcase-profile">
                                <div class="showcase-profile-image">
                                    <div class="showcase-profile-dropdown">
                                        <div class="showcase-profile-image">
                                            <c:set var="avatar" value="${sessionScope.LOGIN_USER.image}"></c:set>
                                            <c:choose>
                                                <c:when test="${fn:startsWith(avatar, 'http')}">
                                                    <img
                                                        src="${sessionScope.LOGIN_USER.image}"
                                                        alt=""
                                                        />
                                                </c:when>
                                                <c:otherwise>
                                                    <img
                                                        src="data:image/jpg/png;base64,${sessionScope.LOGIN_USER.image}"
                                                        alt=""
                                                        />
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                        <div class="showcase-profile-dropdown-list">
                                            <a href="ShowUserFormController?position=ManagerFacilityPage" class="dropdown-item">
                                                <ion-icon name="create-outline"></ion-icon>
                                                Edit Profile
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <a href="LogoutController">
                                    <ion-icon name="log-out-outline"></ion-icon>
                                </a>
                            </div>
                        </div>

                        <!-- in those have 3 Pages -->
                        <div class="showcase-content-list">

                            <!-- Facility -->
                            <div class="showcase-content-item active">
                                <div class="facility-heading">
                                    <div class="facility-heading-header">
                                        <h2 class="showcase-title">Facilities</h2>
                                        <form action="SearchFacilityController" class="showcase-form">
                                            <input
                                                type="text"
                                                name="search"
                                                value="${requestScope.SEARCH}"
                                                placeholder="Search Facilities..."
                                                />
                                            <button type="submit">
                                                <ion-icon name="search"></ion-icon>
                                            </button>
                                        </form>
                                    </div>
                                </div>

                                <div class="content-item-main facility-content-main">

                                    <div class="content-item-main-list">
                                        <div class="content-item-main-item active">
                                            <!-- List -->
                                            <div class="content-item-main-category-item facility-item-main facility-list active">
                                                <ul class="facility-list-heading">
                                                    <li class="facility-list-item ${requestScope.STYLE_LIST_ALL}" data-index="0">
                                                        All
                                                    </li>
                                                    <li class="facility-list-item" data-index="1">
                                                        Electronic
                                                    </li>
                                                    <li class="facility-list-item" data-index="2">
                                                        Water
                                                    </li>
                                                    <li class="facility-list-item" data-index="3">
                                                        Environment
                                                    </li>
                                                    <li class="facility-list-item" data-index="4">
                                                        Others
                                                    </li>
                                                </ul>
                                                <div class="facility-list-showcase">
                                                    <!-- list All -->
                                                    <div class="facility-list-showcase-item active">
                                                        <div class="list">
                                                            <c:if test="${empty sessionScope.FACILTIES_LIST_ALL}">
                                                                <p class="showcase-desc">
                                                                    No result can be found ...
                                                                </p>
                                                            </c:if>
                                                            <c:forEach var="facility" items="${sessionScope.FACILTIES_LIST_ALL}">
                                                                <div class="pipe-item">
                                                                    <div class="pipe-item-heading">
                                                                        <img
                                                                            src="${facility.image}"
                                                                            alt=""
                                                                            />
                                                                    </div>
                                                                    <div class="pipe-item-bottom">
                                                                        <div class="pipe-item-bottom-heading">
                                                                            <h2 class="pipe-item-title">
                                                                                ${facility.facilityName}
                                                                            </h2>
                                                                            <p class="pipe-item-desc">Quantity: ${facility.quantity}</p>
                                                                        </div>
                                                                        <div class="pipe-item-bottom-footer">
                                                                            <p class="pipe-item-desc pipe-item-date">
                                                                                Maintain Date: ${facility.maintenanceDate}
                                                                            </p>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </c:forEach>
                                                        </div>
                                                    </div>
                                                    <!-- list Electronic -->
                                                    <div class="facility-list-showcase-item">
                                                        <div class="list">
                                                            <c:if test="${empty sessionScope.FACILTIES_LIST_ELECTRIC}">
                                                                <p class="showcase-desc">
                                                                    No result can be found ...
                                                                </p>
                                                            </c:if>
                                                            <c:forEach var="facility" items="${sessionScope.FACILTIES_LIST_ELECTRIC}">
                                                                <div class="pipe-item">
                                                                    <div class="pipe-item-heading">
                                                                        <img
                                                                            src="${facility.image}"
                                                                            alt=""
                                                                            />
                                                                    </div>
                                                                    <div class="pipe-item-bottom">
                                                                        <div class="pipe-item-bottom-heading">
                                                                            <h2 class="pipe-item-title">
                                                                                ${facility.facilityName}
                                                                            </h2>
                                                                            <p class="pipe-item-desc">Quantity: ${facility.quantity}</p>
                                                                        </div>
                                                                        <div class="pipe-item-bottom-footer">
                                                                            <p class="pipe-item-desc pipe-item-date">
                                                                                Maintain Date: ${facility.maintenanceDate}
                                                                            </p>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </c:forEach>
                                                        </div>
                                                    </div>
                                                    <!-- list Water -->
                                                    <div class="facility-list-showcase-item">
                                                        <div class="list">
                                                            <c:if test="${empty sessionScope.FACILTIES_LIST_WATER}">
                                                                <p class="showcase-desc">
                                                                    No result can be found ...
                                                                </p>
                                                            </c:if>
                                                            <c:forEach var="facility" items="${sessionScope.FACILTIES_LIST_WATER}">
                                                                <div class="pipe-item">
                                                                    <div class="pipe-item-heading">
                                                                        <img
                                                                            src="${facility.image}"
                                                                            alt=""
                                                                            />
                                                                    </div>
                                                                    <div class="pipe-item-bottom">
                                                                        <div class="pipe-item-bottom-heading">
                                                                            <h2 class="pipe-item-title">
                                                                                ${facility.facilityName}
                                                                            </h2>
                                                                            <p class="pipe-item-desc">Quantity: ${facility.quantity}</p>
                                                                        </div>
                                                                        <div class="pipe-item-bottom-footer">
                                                                            <p class="pipe-item-desc pipe-item-date">
                                                                                Maintain Date: ${facility.maintenanceDate}
                                                                            </p>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </c:forEach>
                                                        </div>
                                                    </div>
                                                    <!-- list Environment -->
                                                    <div class="facility-list-showcase-item">
                                                        <div class="list">
                                                            <c:if test="${empty sessionScope.FACILTIES_LIST_ENVIROMENT}">
                                                                <p class="showcase-desc">
                                                                    No result can be found ...
                                                                </p>
                                                            </c:if>
                                                            <c:forEach var="facility" items="${sessionScope.FACILTIES_LIST_ENVIROMENT}">
                                                                <div class="pipe-item">
                                                                    <div class="pipe-item-heading">
                                                                        <img
                                                                            src="${facility.image}"
                                                                            alt=""
                                                                            />
                                                                    </div>
                                                                    <div class="pipe-item-bottom">
                                                                        <div class="pipe-item-bottom-heading">
                                                                            <h2 class="pipe-item-title">
                                                                                ${facility.facilityName}
                                                                            </h2>
                                                                            <p class="pipe-item-desc">Quantity: ${facility.quantity}</p>
                                                                        </div>
                                                                        <div class="pipe-item-bottom-footer">
                                                                            <p class="pipe-item-desc pipe-item-date">
                                                                                Maintain Date: ${facility.maintenanceDate}
                                                                            </p>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </c:forEach>
                                                        </div>
                                                    </div>
                                                    <!-- list Others -->
                                                    <div class="facility-list-showcase-item">
                                                        <div class="list">
                                                            <c:if test="${empty sessionScope.FACILTIES_LIST_OTHERS}">
                                                                <p class="showcase-desc">
                                                                    No result can be found ...
                                                                </p>
                                                            </c:if>
                                                            <c:forEach var="facility" items="${sessionScope.FACILTIES_LIST_OTHERS}">
                                                                <div class="pipe-item">
                                                                    <div class="pipe-item-heading">
                                                                        <img
                                                                            src="${facility.image}"
                                                                            alt=""
                                                                            />
                                                                    </div>
                                                                    <div class="pipe-item-bottom">
                                                                        <div class="pipe-item-bottom-heading">
                                                                            <h2 class="pipe-item-title">
                                                                                ${facility.facilityName}
                                                                            </h2>
                                                                            <p class="pipe-item-desc">Quantity: ${facility.quantity}</p>
                                                                        </div>
                                                                        <div class="pipe-item-bottom-footer">
                                                                            <p class="pipe-item-desc pipe-item-date">
                                                                                Maintain Date: ${facility.maintenanceDate}
                                                                            </p>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </c:forEach>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>

        <script src="${pageContext.request.contextPath}/js/adminPage1.js"></script>
        <script src="${pageContext.request.contextPath}/js/ManagerFacility.js"></script>
    </body>
</html>

