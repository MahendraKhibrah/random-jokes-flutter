enum Env { dev, prod }

abstract class AppEnv {
  static late String baseMainUrl;
  static late String title;
  static late Env _env;

  static Env get env => _env;

  static setupEnv(Env env) {
    _env = env;
    switch (env) {
      case Env.dev:
        {
          baseMainUrl = 'https://example.p.rapidapi.com/random/example';
          title = 'example dev';
          break;
        }
      case Env.prod:
        {
          baseMainUrl = 'https://dad-jokes.p.rapidapi.com/random/example';
          title = 'example';
          break;
        }
    }
  }
}
