<%-- 
    Document   : ManagerViewUser
    Created on : Sep 25, 2021, 2:03:25 PM
    Author     : Admin
--%>

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

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminPage.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/ManagerViewUser.css" />
    </head>
    <body>

        <!-- if you want to open modal, you add class for div[class = 'user-form'] value: 'open' -->
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
                                <a href="ShowUserController">
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
                                <li class="showcase-item active" data-index="1">
                                    <a href="ShowUserController" class="showcase-link">
                                        <ion-icon
                                            name="people-outline"
                                            class="no-active-mode"
                                            ></ion-icon>
                                        <ion-icon name="people" class="active-mode"></ion-icon>
                                    </a>
                                    <span></span>
                                </li>
                                <li class="showcase-item" data-index="2">
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
                                    data-index="4"
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
                                            <a href="ShowUserFormController?position=ManagerUserPage" class="dropdown-item">
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
                            <!-- If you want to Page is show for user you only need to add class 'active' for div[class="showcase-content-item"]  -->

                            <!-- User -->
                            <div class="showcase-content-item active">
                                <div class="user-heading">
                                    <div class="user-heading-header">
                                        <h2 class="showcase-title">Users</h2>
                                        <form action="SearchStudentController" class="showcase-form">
                                            <input
                                                type="text"
                                                name="search"
                                                value="${requestScope.SEARCH}"
                                                placeholder="Search User..."
                                                />
                                            <button type="submit">
                                                <ion-icon name="search"></ion-icon>
                                            </button>
                                        </form>
                                    </div>
                                    <ul class="showcase-user-category">
                                        <div class="category-list">
                                            <li class="category-item ${requestScope.STYLE_LIST_ALL}" data-index="0">All</li>
                                            <li class="category-item ${requestScope.STYLE_LIST_STUDENT}" data-index="1">Student</li>
                                            <li class="category-item ${requestScope.STYLE_LIST_EMPLOYEE}" data-index="2">Employee</li>
                                            <li class="category-item ${requestScope.STYLE_LIST_ACTIVE}" data-index="3">Active</li>
                                            <li class="category-item ${requestScope.STYLE_LIST_INACTIVE}" data-index="4">Inactive</li>
                                        </div>
                                    </ul>
                                </div>

                                <div class="content-item-main user-item-main-list">
                                    <!-- Pipe -->
                                    <div class="content-item-main-list user-main-item active">
                                        <!-- user all page -->
                                        <div class="user-content-main-item ${requestScope.STYLE_LIST_ALL}">
                                            <div class="user-list">
                                                <c:if test="${empty sessionScope.LIST_ALL_USER}">
                                                    <p class="pipe-item-date">No result can be found ...</p>
                                                </c:if>
                                                <c:forEach var="user" items="${sessionScope.LIST_ALL_USER}">
                                                    <div class="user-item ${user.statusID}">
                                                        <div class="user-item-heading">
                                                            <div class="user-item-image">
                                                                <c:set var="image" value="${user.image}"/>
                                                                <c:choose>
                                                                    <c:when test="${fn:startsWith(image, 'http')}">
                                                                        <img
                                                                            src="${user.image}"
                                                                            alt=""
                                                                            />
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <img
                                                                            src="data:image/jpg/png;base64,${user.image}"
                                                                            alt=""
                                                                            />
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </div>
                                                            <div class="user-item-showcase">
                                                                <h4 class="user-item-name">
                                                                    ${user.fullName}
                                                                </h4>
                                                                <div class="user-item-email">
                                                                    ${user.email}
                                                                </div>
                                                                <a href="#" class="btn btn--${user.statusID}">${user.statusName}</a>
                                                            </div>
                                                        </div>
                                                        <div class="user-item-bottom">
                                                            <a href="AUController?userID=${user.userID}&StatusID=${user.statusID}&style_flag=all" class="user-item-link inactive">
                                                                <ion-icon name="close-outline"></ion-icon
                                                                >Inactivate
                                                            </a>
                                                            <a href="AUController?userID=${user.userID}&StatusID=${user.statusID}&style_flag=all" class="user-item-link active">
                                                                <ion-icon name="checkmark-outline"></ion-icon
                                                                >Activate
                                                            </a>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>

                                        <!-- user student page -->
                                        <div class="user-content-main-item ${requestScope.STYLE_LIST_STUDENT}">
                                            <div class="user-list">
                                                <c:if test="${empty sessionScope.LIST_ALL_STUDENT}">
                                                    <p class="pipe-item-date">No result can be found ...</p>
                                                </c:if>
                                                <c:forEach var="user" items="${sessionScope.LIST_ALL_STUDENT}">
                                                    <div class="user-item ${user.statusID}">
                                                        <div class="user-item-heading">
                                                            <div class="user-item-image">
                                                                <c:set var="image" value="${user.image}"/>
                                                                <c:choose>
                                                                    <c:when test="${fn:startsWith(image, 'http')}">
                                                                        <img
                                                                            src="${user.image}"
                                                                            alt=""
                                                                            />
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <img
                                                                            src="data:image/jpg/png;base64,${user.image}"
                                                                            alt=""
                                                                            />
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </div>
                                                            <div class="user-item-showcase">
                                                                <h4 class="user-item-name">
                                                                    ${user.fullName}
                                                                </h4>
                                                                <div class="user-item-email">
                                                                    ${user.email}
                                                                </div>
                                                                <a href="#" class="btn btn--${user.statusID}">${user.statusName}</a>
                                                            </div>
                                                        </div>
                                                        <div class="user-item-bottom">
                                                            <a href="AUController?userID=${user.userID}&StatusID=${user.statusID}&style_flag=all" class="user-item-link inactive">
                                                                <ion-icon name="close-outline"></ion-icon
                                                                >Inactivate
                                                            </a>
                                                            <a href="AUController?userID=${user.userID}&StatusID=${user.statusID}&style_flag=all" class="user-item-link active">
                                                                <ion-icon name="checkmark-outline"></ion-icon
                                                                >Activate
                                                            </a>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>

                                        <!-- user employee page -->
                                        <div class="user-content-main-item ${requestScope.STYLE_LIST_EMPLOYEE}">
                                            <div class="user-list">
                                                <c:if test="${empty sessionScope.LIST_ALL_EMPLOYEE}">
                                                    <p class="pipe-item-date">No result can be found ...</p>
                                                </c:if>
                                                <c:forEach var="user" items="${sessionScope.LIST_ALL_EMPLOYEE}">
                                                    <div class="user-item ${user.statusID}">
                                                        <div class="user-item-heading">
                                                            <div class="user-item-image">
                                                                <c:set var="image" value="${user.image}"/>
                                                                <c:choose>
                                                                    <c:when test="${fn:startsWith(image, 'http')}">
                                                                        <img
                                                                            src="${user.image}"
                                                                            alt=""
                                                                            />
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <img
                                                                            src="data:image/jpg/png;base64,${user.image}"
                                                                            alt=""
                                                                            />
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </div>
                                                            <div class="user-item-showcase">
                                                                <h4 class="user-item-name">
                                                                    ${user.fullName}
                                                                </h4>
                                                                <div class="user-item-email">
                                                                    ${user.email}
                                                                </div>
                                                                <a href="#" class="btn btn--${user.statusID}">${user.statusName}</a>
                                                            </div>
                                                        </div>
                                                        <div class="user-item-bottom">
                                                            <a href="AUController?userID=${user.userID}&StatusID=${user.statusID}&style_flag=all" class="user-item-link inactive">
                                                                <ion-icon name="close-outline"></ion-icon
                                                                >Inactivate
                                                            </a>
                                                            <a href="AUController?userID=${user.userID}&StatusID=${user.statusID}&style_flag=all" class="user-item-link active">
                                                                <ion-icon name="checkmark-outline"></ion-icon
                                                                >Activate
                                                            </a>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>

                                        <!-- user active user page -->
                                        <div class="user-content-main-item ${requestScope.STYLE_LIST_ACTIVE}">
                                            <div class="user-list">
                                                <c:if test="${empty sessionScope.LIST_ALL_ACTIVE}">
                                                    <p class="pipe-item-date">No result can be found ...</p>
                                                </c:if>
                                                <c:forEach var="user" items="${sessionScope.LIST_ALL_ACTIVE}">
                                                    <div class="user-item ${user.statusID}">
                                                        <div class="user-item-heading">
                                                            <div class="user-item-image">
                                                                <c:set var="image" value="${user.image}"/>
                                                                <c:choose>
                                                                    <c:when test="${fn:startsWith(image, 'http')}">
                                                                        <img
                                                                            src="${user.image}"
                                                                            alt=""
                                                                            />
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <img
                                                                            src="data:image/jpg/png;base64,${user.image}"
                                                                            alt=""
                                                                            />
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </div>
                                                            <div class="user-item-showcase">
                                                                <h4 class="user-item-name">
                                                                    ${user.fullName}
                                                                </h4>
                                                                <div class="user-item-email">
                                                                    ${user.email}
                                                                </div>
                                                                <a href="#" class="btn btn--${user.statusID}">${user.statusName}</a>
                                                            </div>
                                                        </div>
                                                        <div class="user-item-bottom">
                                                            <a href="AUController?userID=${user.userID}&StatusID=${user.statusID}&style_flag=all" class="user-item-link inactive">
                                                                <ion-icon name="close-outline"></ion-icon
                                                                >Inactivate
                                                            </a>
                                                            <a href="AUController?userID=${user.userID}&StatusID=${user.statusID}&style_flag=all" class="user-item-link active">
                                                                <ion-icon name="checkmark-outline"></ion-icon
                                                                >Activate
                                                            </a>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>

                                        <!-- user inactive user page -->
                                        <div class="user-content-main-item ${requestScope.STYLE_LIST_INACTIVE}">
                                            <div class="user-list">
                                                <c:if test="${empty sessionScope.LIST_ALL_INACTIVE}">
                                                    <p class="pipe-item-date">No result can be found ...</p>
                                                </c:if>
                                                <c:forEach var="user" items="${sessionScope.LIST_ALL_INACTIVE}">
                                                    <div class="user-item ${user.statusID}">
                                                        <div class="user-item-heading">
                                                            <div class="user-item-image">
                                                                <c:set var="image" value="${user.image}"/>
                                                                <c:choose>
                                                                    <c:when test="${fn:startsWith(image, 'http')}">
                                                                        <img
                                                                            src="${user.image}"
                                                                            alt=""
                                                                            />
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <img
                                                                            src="data:image/jpg/png;base64,${user.image}"
                                                                            alt=""
                                                                            />
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </div>
                                                            <div class="user-item-showcase">
                                                                <h4 class="user-item-name">
                                                                    ${user.fullName}
                                                                </h4>
                                                                <div class="user-item-email">
                                                                    ${user.email}
                                                                </div>
                                                                <a href="#" class="btn btn--${user.statusID}">${user.statusName}</a>
                                                            </div>
                                                        </div>
                                                        <div class="user-item-bottom">
                                                            <a href="AUController?userID=${user.userID}&StatusID=${user.statusID}&style_flag=all" class="user-item-link inactive">
                                                                <ion-icon name="close-outline"></ion-icon
                                                                >Inactivate
                                                            </a>
                                                            <a href="AUController?userID=${user.userID}&StatusID=${user.statusID}&style_flag=all" class="user-item-link active">
                                                                <ion-icon name="checkmark-outline"></ion-icon
                                                                >Activate
                                                            </a>
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
            </section>
        </main>
        <script src="${pageContext.request.contextPath}/js/adminPage1.js"></script>
        <script src="${pageContext.request.contextPath}/js/ManagerUser.js"></script>
        <!-- Query -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script>
            $(function () {
                // This code will attach `fileselect` event to all file inputs on the page
                $(document).on("change", ":file", function () {
                    var input = $(this),
                            numFiles = input.get(0).files ? input.get(0).files.length : 1,
                            label = input.val().replace(/\\/g, "/").replace(/.*\//, "");
                    input.trigger("fileselect", [numFiles, label]);
                });

                var imagesPreview = function (input) {
                    if (input.files) {
                        var filesAmount = input.files.length;

                        for (i = 0; i < filesAmount; i++) {
                            var reader = new FileReader();

                            reader.onload = function (event) {
                                // $($.parseHTML("<img>"))
                                //   .attr("src", event.target.result)
                                //   .appendTo(placeToInsertImagePreview);\
                                $(".avatar").attr("src", event.target.result);
                            };

                            reader.readAsDataURL(input.files[i]);
                        }
                    }
                };

                $("#image").on("change", function (e) {
                    imagesPreview(this);
                });
            });
        </script>
    </body>
</html>


