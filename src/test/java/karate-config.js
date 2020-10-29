function fn() {
     karate.configure('connectTimeout', 60000);
     karate.configure('readTimeout', 60000);
     karate.configure('logPrettyResponse', true);

     var config = {
         baseUrl : 'https://restful-booker.herokuapp.com'
     }

//     var accessToken = karate.callSingle('classpath:common/signIn.feature', config).authToken
//     karate.configure('headers', {cookie: 'token=' + accessToken})

     return config;
 }