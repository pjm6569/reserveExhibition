<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
    <!-- Include necessary meta tags and stylesheets -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Include Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Additional styling for the search form */
        .search-form {
            padding: 20px;
            background-color: #f8f9fa;
            border-bottom: 1px solid #dee2e6;
        }
        .search-form .form-row {
            align-items: center;
        }
        /* Adjusting width proportions */
        select[name="category"],
        input[name="name"] {
            width: 100%; /* Full width */
        }
        /* Additional styling for date inputs */
        .date-inputs {
            display: flex;
            align-items: center;
        }
        .date-inputs label {
            margin-right: 10px;
        }
    </style>

</head>
<body>
    <!-- Search form -->
    <div class="search-form">
        <form action="exhibits.jsp" method="get">
            <div class="container">
                <div class="row justify-content-between">
                    <div class="col-md-3">
                        <select name="category" class="form-control">
                            <option value="">분류</option>
                            <option value="photo">사진</option>
                            <option value="relic">유물</option>
                            <option value="painting">그림</option>
                        </select>
                    </div>
                    <div class="col-md-9">
                        <input type="text" name="name" placeholder="이름으로 검색" class="form-control">
                    </div>
                </div>
                <div class="row mt-2 date-inputs">
                    <div class="col-md-6">
                        <label for="startDate">시작일:</label>
                        <input type="date" name="startDate" class="form-control">
                    </div>
                    <div class="col-md-6"> 
                        <label for="endDate">종료일:</label>
                        <input type="date" name="endDate" class="form-control">
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-md-12 text-right">
                        <button type="submit" class="btn btn-primary">검색</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
		<%-- 검색 폼 아래 간격 --%>
	<div style="margin-bottom: 20px;"></div>
    <!-- Include Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
