{
  lib,
  acme,
  aiohttp,
  atomicwrites-homeassistant,
  attrs,
  buildPythonPackage,
  ciso8601,
  cryptography,
  fetchFromGitHub,
  pycognito,
  pyjwt,
  pytest-aiohttp,
  pytest-timeout,
  pytestCheckHook,
  pythonOlder,
  setuptools,
  snitun,
  syrupy,
  xmltodict,
}:

buildPythonPackage rec {
  pname = "hass-nabucasa";
  version = "0.82.0";
  pyproject = true;

  disabled = pythonOlder "3.11";

  src = fetchFromGitHub {
    owner = "nabucasa";
    repo = "hass-nabucasa";
    rev = "refs/tags/${version}";
    hash = "sha256-hRhRXpiIPrI3umOhsVWLwkSwtEfwevC3fNvJElhKy+I=";
  };

  pythonRelaxDeps = [ "acme" ];


  build-system = [ setuptools ];

  dependencies = [
    acme
    aiohttp
    atomicwrites-homeassistant
    attrs
    ciso8601
    cryptography
    pycognito
    pyjwt
    snitun
  ];

  nativeCheckInputs = [
    pytest-aiohttp
    pytest-timeout
    pytestCheckHook
    syrupy
    xmltodict
  ];

  pythonImportsCheck = [ "hass_nabucasa" ];

  meta = with lib; {
    description = "Python module for the Home Assistant cloud integration";
    homepage = "https://github.com/NabuCasa/hass-nabucasa";
    changelog = "https://github.com/NabuCasa/hass-nabucasa/releases/tag/${version}";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ Scriptkiddi ];
  };
}
