using Microsoft.AspNetCore.Mvc;
using System;

namespace First_task.Controllers
{
    public class WeatherData
    {
        public int Id { get; set; } 
        public string Date { get; set; }
        public int Degree { get; set; }
        public string Location { get; set; }
    }

    [ApiController]
    [Route("[controller]")]
    public class WeatherForecastController : ControllerBase
    {
        private static readonly List<string> Summaries = new()
        {
        "Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
        };

        public static List<WeatherData> weatherDatas = new()
        {
            new WeatherData() { Id = 1, Date = "20.01.2023", Degree=10, Location="��������"},
            new WeatherData() { Id = 2, Date = "5.02.2023", Degree=-2, Location="������"},
            new WeatherData() { Id = 3, Date = "4.02.2023", Degree=5, Location="���������"},
            new WeatherData() { Id = 4, Date = "1.01.2023", Degree=-10, Location="������"},
            new WeatherData() { Id = 5, Date = "10.02.2023", Degree=9, Location="������"},
        };
        private readonly ILogger<WeatherForecastController> _logger;

        public WeatherForecastController(ILogger<WeatherForecastController> logger)
        {
            _logger = logger;
        }

        [HttpGet]
        public List<WeatherData> GetAll()
        {
            return weatherDatas;
        }

        [HttpGet("id")]
        public IActionResult GetIndex(int id)
        {
            for(int i = 0; i< weatherDatas.Count; i++)
            {
                if (weatherDatas[i].Id == id)
                    return Ok(weatherDatas[i]);
            }
            return BadRequest("����� ������ ���!");
        }

        [HttpGet("find-by-city")]
        public IActionResult GetCity(string city)
        {
            for (int i = 0; i < weatherDatas.Count; i++)
            {
                if (weatherDatas[i].Location.ToLower() == city.ToLower())
                    return Ok("������ � ����� ������� ������� � ����� ������!");
            }
            return BadRequest("����� ������ ���!");
        }

        [HttpPost]
        public IActionResult Add(WeatherData data)
        {
            if (data.Id < 0)
                return BadRequest("Id �� ����� ���� ������ 0");

            for(int i = 0; i < weatherDatas.Count; i++)
            {
                if (weatherDatas[i].Id == data.Id)
                    return BadRequest($"������ � id {data.Id} ��� ����������");
            }
            weatherDatas.Add(data);
            return Ok();
                        
        }

        [HttpPut]
        public IActionResult Update(WeatherData data) 
        {
            if (data.Id < 0)
                return BadRequest("Id �� ����� ���� ������ 0");

            for (int i = 0; i<weatherDatas.Count; i++)
            {
                if (weatherDatas[i].Id == data.Id)
                {
                    weatherDatas[i] = data;
                    return Ok();
                }
            }
            return BadRequest("����� ������ ���");
        }
        [HttpDelete]
        public IActionResult Delete(int id)
        {
            for (int i = 0; i< weatherDatas.Count; i++)
            {
                if (weatherDatas[i].Id == id)
                {
                    weatherDatas.RemoveAt(i);
                    return Ok();
                }
            }
            return BadRequest("����� ������ �� ����������!");
        }
        
    }
}