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
            <a class="nav-link active" aria-current="page" href="/Test_war/">Raspberry pi NAS</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/Test_war/file-view">File_View</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/Test_war/file/">File_UpLoad</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false">Menu</a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="/Test_war/file-view">File_View</a></li>
              <li><a class="dropdown-item" href="/Test_war/file/">File_UpLoad</a></li>
              <li><a class="dropdown-item" href="#">___</a></li>
              <li><a class="dropdown-item" href="#">LogOut</a></li>
            </ul>
          </li>
        </ul>
      </div>
    </div>
  </nav>