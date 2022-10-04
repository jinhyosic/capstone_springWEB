<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<!DOCTYPE html>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark" aria-label="Tenth navbar example">
    <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample08" aria-controls="navbarsExample08" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-md-center" id="navbarsExample08">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/">Raspberry pi NAS</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

        <div class="col-xl-10 col-lg-12 col-md-9">

            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-5">
<form action="/join" method="POST">
    <div class="input-group mb-3">
        <input type="email" name="userId" class="form-control" placeholder="Example@domain.com">
        <div class="input-group-append">
            <div class="input-group-text">
                <span class="fas fa-exclamation"></span>
            </div>
        </div>
    </div>
    <div class="input-group mb-3">
        <input type="text" name="userName" class="form-control" placeholder="이름">
        <div class="input-group-append">
            <div class="input-group-text">
                <span class="fas fa-user"></span>
            </div>
        </div>
    </div>
    <div class="input-group mb-3" style="text-align: center;">
        <div class="btn-group" data-toggle="buttons">
            <label class="btn btn-dark active">
                <input type="radio" name="userGender" autocomplete="off" value="M" checked>남자
            </label>
            <label class="btn btn-dark active">
                <input type="radio" name="userGender" autocomplete="off" value="F" checked>여자
            </label>
        </div>
    </div>
    <div class="input-group mb-3">
        <input type="password" name="userPw" class="form-control" placeholder="비밀번호">
        <div class="input-group-append">
            <div class="input-group-text">
                <span class="fas fa-lock"></span>
            </div>
        </div>
    </div>
    <div class="input-group mb-3">
        <input type="text" name="userAuthority" class="form-control" placeholder="user입력">
        <div class="input-group-append">
            <div class="input-group-text">
                <span class="fas fa-lock"></span>
            </div>
        </div>
    </div>

        <!-- /.col -->
        <div class="col-4">
            <button type="submit" href="/file-view" class="btn btn-dark btn-block">Sign Up</button>
        </div>
        <!-- /.col -->

</form>
                </div>
            </div>
        </div>
    </div>
</div>