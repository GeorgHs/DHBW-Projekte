<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!-- Modal für User Settings ändern -->
<div class="modal fade" id="settingsModal" tabindex="-1" role="dialog" aria-labelledby="settingsModal" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
            <h1>Profil überarbeiten</h1>
            </div>
            <div class="modal-body">

                <form>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" id="email" value="${param.email}">
                        <div class="invalid-feedback" id="invalid-email" style="display: none">
                            Email wird bereits verwendet
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="handle">Handle</label>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="handle-prepend">@</span>
                            </div>
                            <input type="text" class="form-control" name="handle" id="handle" value="${param.handle}" aria-describedby="handle-prepend" required>
                            <div class="invalid-feedback" id="invalid-handle" style="display: none">
                                Handle is already taken
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="username">Nutzername</label>
                        <input type="email" class="form-control" id="username" value="${param.username}">
                        <div class="invalid-feedback" id="invalid-username" style="display: none">
                            Der Nutzername existiert bereits
                        </div>
                    </div>
                    <div class="form-group password-form-group">
                        <label for="password">Passwort ändern</label>
                        <input type="password" class="form-control" id="password" placeholder="Derzeitiges Passwort">
                        <input type="password" class="form-control" id="password-new" placeholder="Neues Passwort">
                        <input type="password" class="form-control" id="password-new-wdh" placeholder="Neues Passwort wiederholen">
                        <div class="invalid-feedback" id="invalid-password" style="display: none">
                            Passwort ist falsch oder das neue Passwort stimmt nicht überein
                        </div>
                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary cancel" data-dismiss="modal">Schließen</button>
                <button type="button" class="btn btn-primary cancel" onclick="changeSettings()">Speichern</button>
            </div>
        </div>
    </div>
</div>