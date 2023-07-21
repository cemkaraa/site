<%@ Page Title="" Language="C#" MasterPageFile="~/User/user.Master" AutoEventWireup="true" CodeBehind="Tarifler.aspx.cs" Inherits="Bitirme_Restoran.User.Tarifler" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f2f2f2;
      margin: 0;
      padding: 20px;
    }

    h1 {
      text-align: center;
    }

    .recipe-list {
      max-width: 800px;
      margin: 0 auto;
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
    }

    .recipe-card {
      width: 200px;
      height: 200px;
      background-color: #ffbe33;
      padding: 10px;
      margin: 10px;
      border-radius: 10px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
      cursor: pointer;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      transition: all 0.3s ease;
      z-index: 1;
    }

    .recipe-card.active {
      width: 300px;
      height: 300px;
      margin: 0 auto;
      margin-bottom: 20px;
      z-index: 2;
    }

    .recipe-card h2 {
      color: #222831;
      margin-top: 0;
      text-align: center;
      transition: all 0.3s ease;
    }

    .recipe-card:hover h2 {
      font-size: 18px;
    }

    .recipe-card img {
      max-width: 120px;
      max-height: 120px;
      margin-bottom: 10px;
      transition: all 0.3s ease;
    }

    .recipe-card:hover img {
      max-width: 140px;
      max-height: 140px;
    }

    .recipe-details {
      position: fixed;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      width: 80%;
      height: 80%;
      max-width: 800px;
      max-height: 800px;
      background-color: #fff;
      padding: 40px;
      border-radius: 10px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
      display: none;
      z-index: 2;
      overflow-y: auto;
    }

    .recipe-details.active {
      display: block;
    }

    .recipe-details h2 {
      margin-top: 0;
      text-align: center;
      font-size: 28px;
      color: #ff5722;
    }

    .recipe-details p {
      font-size: 18px;
      color: #555555;
    }

    .recipe-details .recipe-content {
      margin-top: 20px;
    }
  </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  <h1>Lezzetli Tarifler</h1>
  <div class="recipe-list">
    <div class="recipe-card" onclick="showRecipeDetails(1)">
      <img src="pizza.jpg" alt="Pizza">
      <h2>Pizza</h2>
    </div>
    <div class="recipe-card" onclick="showRecipeDetails(2)">
      <img src="pasta.jpg" alt="Pasta">
      <h2>Pasta</h2>
    </div>
    <div class="recipe-card" onclick="showRecipeDetails(3)">
      <img src="kofte.jpg" alt="Köfte">
      <h2>Köfte</h2>
    </div>
    <div class="recipe-card" onclick="showRecipeDetails(4)">
      <img src="kebap.jpg" alt="Kebap">
      <h2>Kebap</h2>
    </div>
  </div>

  <div class="recipe-details" id="recipeDetails">
    <div class="recipe-content">
      <h2 id="recipeTitle"></h2>
      <p id="recipeDescription"></p>
      <div id="recipeIngredients">
        <h3>Malzemeler:</h3>
        <ul>
          <li>Malzeme 1</li>
          <li>Malzeme 2</li>
          <li>Malzeme 3</li>
        </ul>
      </div>
      <div id="recipeInstructions">
        <h3>Yapılış:</h3>
        <ol>
          <li>Adım 1</li>
          <li>Adım 2</li>
          <li>Adım 3</li>
        </ol>
      </div>
    </div>
    <button class="close-button" onclick="hideRecipeDetails()">X</button>
  </div>

  <script>
      function showRecipeDetails(recipeId) {
          var recipeTitleElement = document.getElementById('recipeTitle');
          var recipeDescriptionElement = document.getElementById('recipeDescription');
          var recipeIngredientsElement = document.getElementById('recipeIngredients');
          var recipeInstructionsElement = document.getElementById('recipeInstructions');
          var recipeDetailsElement = document.getElementById('recipeDetails');
          var recipeCards = document.querySelectorAll('.recipe-card');

          // Örnek veritabanı nesneleri
          var recipes = [
              {
                  id: 1,
                  title: 'Pizza',
                  description: 'Ev yapımı pizza tarifi.',
                  ingredients: ['Un', 'Domates sosu', 'Peynir', 'Sucuk'],
                  instructions: ['Hamur yoğurun', 'Malzemeleri ekleyin', 'Fırında pişirin']
              },
              {
                  id: 2,
                  title: 'Pasta',
                  description: 'İtalyan usulü makarna tarifi.',
                  ingredients: ['Makarna', 'Sos', 'Parmesan peyniri'],
                  instructions: ['Makarnayı haşlayın', 'Sosu ekleyin', 'Peynirle süsleyin']
              },
              {
                  id: 3,
                  title: 'Köfte',
                  description: 'Anne köfte tarifi.',
                  ingredients: ['Kıyma', 'Soğan', 'Baharatlar'],
                  instructions: ['Malzemeleri yoğurun', 'Şekil verin', 'Kızgın tavada pişirin']
              },
              {
                  id: 4,
                  title: 'Kebap',
                  description: 'Lezzetli kebap tarifi.',
                  ingredients: ['Kuzu eti', 'Soğan', 'Baharatlar'],
                  instructions: ['Etleri marine edin', 'Şişe dizin', 'Mangalda pişirin']
              }
          ];

          var selectedRecipe = recipes.find(function (recipe) {
              return recipe.id === recipeId;
          });

          if (selectedRecipe) {
              recipeTitleElement.textContent = selectedRecipe.title;
              recipeDescriptionElement.textContent = selectedRecipe.description;
              recipeIngredientsElement.innerHTML = '<h3>Malzemeler:</h3><ul>' + selectedRecipe.ingredients.map(function (ingredient) {
                  return '<li>' + ingredient + '</li>';
              }).join('') + '</ul>';
              recipeInstructionsElement.innerHTML = '<h3>Yapılış:</h3><ol>' + selectedRecipe.instructions.map(function (instruction) {
                  return '<li>' + instruction + '</li>';
              }).join('') + '</ol>';

              // Tarif bölümünü büyüt
              recipeDetailsElement.classList.add('active');

              // Seçilen yemeğin kutusunu üste taşı
              var selectedRecipeCard = document.querySelector('.recipe-card:nth-child(' + recipeId + ')');
              selectedRecipeCard.classList.add('active');

              // Diğer yemek kutularını üsten kaydır
              recipeCards.forEach(function (recipeCard) {
                  if (recipeCard !== selectedRecipeCard) {
                      recipeCard.classList.remove('active');
                  }
              });
          } else {
              hideRecipeDetails();
          }
      }

      function hideRecipeDetails() {
          var recipeDetailsElement = document.getElementById('recipeDetails');
          var recipeCards = document.querySelectorAll('.recipe-card');
          recipeDetailsElement.classList.remove('active');
          recipeCards.forEach(function (recipeCard) {
              recipeCard.classList.remove('active');
          });
      }
  </script>
</asp:Content>
