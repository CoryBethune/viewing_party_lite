# Viewing Party Lite

<ul>
<li><b>Viewing Party Lite</b> is a <b>Rails</b> application that allows a user to search for movies using the <a href="https://developers.themoviedb.org/3/getting-started/introduction"> The Movie Database API</a>.</li>

<li>The user is provided with an option to create a viewing party after a movie is selected.</li>

<li>This application utilizes a <b>relational database</b> to store user and viewing party data.</li>

<li>The application was deployed on <b>Heroku</b> but can also be viewed on a local server.</li></ul>

<!-- TABLE OF CONTENTS -->
<h2 id="table-of-contents"> :book: Table of Contents</h2>

<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#techical-requirements"> ➤ Technical Requirements</a></li>
    <li><a href="#project-files-description"> ➤ Project Files Description</a></li>
    <li><a href="#getting-started"> ➤ Getting Started</a></li>
    <li><a href="#scenario1"> ➤ Scenario 1: Encrypting a Message (no date and key provided) </a></li>
    <li><a href="#scenario2"> ➤ Scenario 2: Decrypt an Encrypted File </a></li>
    <li><a href="#scenario3"> ➤ Scenario 3: Encrypt a Message (key provided)  </a></li>
    <li><a href="#scenario4"> ➤ Scenario 4: Scenario 4: Encrypt a Message (date provided)</a></li>
    <li><a href="#credits"> ➤ Credits</a></li>
  </ol>
</details>

<!-- TECHNICAL REQUIREMENTS -->
<h2 id="techical-requirements"> 💻 Technical Requirements</h2>
<ul>
  <li>Ruby 2.7.4</li>
  <li>Rails 5.2.6</li>
  <li>RSpec-Rails 5.1.2</li>
  <li>Faraday</li>
  <li>Figaro</li>
  <li>Webmock</li>
  <li>VCR</li>
  <li>Capybara</li>
  <li>SimpleCov</li>
  <li>Launchy</li>
  <li>Orderly</li>
  <li>Shoulda-Matchers</li>
  </ul>
  <p><i>Installation instructions found in</i> <a href="#getting-started"> ➤ Getting Started</a></p>
   
<!-- PROJECT FILES DESCRIPTION -->
<h2 id="project-files-description"> :floppy_disk: Project Files Description</h2>

<ul>
  <li><b>app/controllers</li></b>
  <ol>
  <li>Contains several controllers that initiates API call processes through <i>movie_facade.rb</i></li></ol>
  <li><b>app/controllers/movie_facade.rb</b></li><ol>
  <li>Processes data returned through <i>app/services</i></li></ol>
   <li><b>app/services</b>
    <ol>
  <li>Makes API calls via <i>Faraday</i></li></ol>
  <li><b>app/poros</b></li><ol>
  <li>Formats API data into Ruby objects</li></ol>
  <li><b>app/models</b><ol>
  <li>Creates <i>User</i> and <i>Party</i> objects in a <i>PostgreSQL</i> database</li></ol>
  <li><b>app/views</b></li><ol>
  <li>Contains multiple pages that reference and render objects</li>
  <li>Built in <i>HTML</i> and <i>CSS</i></li></ol>
</ul>

<h3>Some other supporting files</h3>
<ul><li><b>spec</b><ol>
  <li>Contains tests for views, models, facacades, fixtures, services, poros</li>
  <li><i>spec/fixtures/vcr_cassettes</i><ol>
  <li>Subfolder that contains mocked data used in tests to prevent API endpoint calls every time testing suite is run</li></ol>
</ul>

<!-- GETTING STARTED -->
<h2 id="getting-started"> :book: Getting Started</h2>

<p><b>1. </b> Create a new directory on your computer where you'd like the program to live.</p>
<pre><code>$ mkdir /your_folder/viewing_party_lite</code></pre>

<p><b>2. </b> Navigate into the recently created directory.</p>
<pre><code>$ cd /your_folder/viewing_party_lite</code></pre>
<p><b>3. </b> Copy the repository by clicking on the code button on Github repo page (using SSH).</p>

![183747041-40f47875-442e-4008-8d00-8c45bf2731fe](https://user-images.githubusercontent.com/95776577/183752233-c9130b38-ce16-4b4c-aeb4-fdf0d0d4a137.png)

<p><b>4. </b> Clone the recently copied repository information into your currenty directory.</p>
<pre><code>$ git clone git@github.com:JohnSantosuosso/viewing_party_lite.git</code></pre>

<p><b>5. </b> Open the repository in your preferred IDE.  If you are using VSCode, use the code command shown below:</p>
<pre><code>$ code .</code></pre>

<p><b>6. </b> Install dependencies found in Gemfile</a>.</p>
<pre><code>$ bundle install</code></pre>

<p><b>7. </b> Inside your project directory, install <a href="https://github.com/laserlemon/figaro"> Figaro</a> via your terminal.</p>
<pre><code>$ bundle exec figaro install</code></pre>

<p><b>8. </b> Install <a href="https://lostisland.github.io/faraday/"> Faraday</a>.</p>
<pre><code>$ bundle exec faraday install</code></pre>

<p><b>9. </b> Signup for an <a href="https://developers.themoviedb.org/3/getting-started/introduction"> API Key</a> on The Movie Database</a>. Add Key to config/application.yml file</p>
<pre><code>movie_api_key: <your key></code></pre>

<p><b>10. </b> Run migrations.</a>.</p>
<pre><code>$ rails db:{create,migrate,seed}</code></pre>

<p><b>11. </b> Initiate the application on your local server</a>.</p>
<pre><code>$ rails s</code></pre>

<p><b>12. </b> Open your favorite web browser and enter the URL in the address bar:</p>
<pre><code>localhost:3000</code></pre>


<!-- SCENARIO1 -->
<h2 id="scenario1"> :small_orange_diamond: Scenario 1: Creating a New User</h2>
<p>A new user can be created and stored in the database.  Validations exist to prevent multiple users registered with the same email address.</p>

![Step 1](https://user-images.githubusercontent.com/95776577/188295779-f02b9033-b4d8-4640-b43f-a6eed7937c57.gif)

<!-- SCENARIO2 -->
<h2 id="scenario2"> :small_orange_diamond: Scenario 2: Discover Movies </h2>
<p>A user can search for movies by title and view that movie's details.  A user can also see top rate movies by clicking the <b>Top Movies</b> button</p>

![step 2](https://user-images.githubusercontent.com/95776577/188296031-01b7d35f-cf38-49e0-9bd4-8cc33aa1264b.gif)


<!-- SCENARIO3 -->
<h2 id="scenario3"> :small_orange_diamond: Scenario 3: Create a Viewing Party </h2>
<p>A user can select a movie and create a viewing party for that movie.</p>


![step 3](https://user-images.githubusercontent.com/95776577/188296382-4d1656c0-a27a-44c2-ba90-ff262ab24d21.gif)

<!-- SCENARIO4 -->
<h2 id="scenario4"> :small_orange_diamond: Scenario 4: Viewing User Dashboard </h2>
<p>A user can view the viewing parties they are hosting, as well as the parties they have been invited to.</p>

![step 4](https://user-images.githubusercontent.com/95776577/188296671-a1de8a83-b5a5-4099-853c-a167471fa152.gif)


<!-- CREDITS -->
<h2 id="credits"> :scroll: Credits</h2>
<h3>John Santosuosso</h3>

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/johnsantosuosso)
[![LinkedIn Badge](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/john-santosuosso)

<p>Project inspired and guided by Turing School of Software and Design's <a href="https://developers.themoviedb.org/3/getting-started/introduction"> Viewing Party Lite.</a></p>

