<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/feed">SocialNetwork</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/feed">Feed</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/profile">Profil</a>
            </li>
            <li>
                <form action="/search">
                    <input name="q" type="text">
                    <button type="submit">Search</button>
                </form>
            </li>
        </ul>
        <ul class="navbar-nav">
            <button class="btn" id="logoutbtn">Logout</button>
        </ul>
    </div>
</nav>