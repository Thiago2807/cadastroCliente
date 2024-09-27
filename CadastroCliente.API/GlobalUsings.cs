global using FluentValidation;
global using MediatR;
global using Mapster;
global using Carter;

global using System.Linq.Expressions;

global using CadastroCliente.API.IOC;
global using Microsoft.EntityFrameworkCore;
global using CadastroCliente.API.IOC.Data;

global using System.Security.Cryptography;

global using CadastroCliente.API.Domain.Entities;

global using Microsoft.EntityFrameworkCore.Metadata.Builders;

global using CadastroCliente.API.Domain.Interfaces;
global using CadastroCliente.API.IOC.Data.Repository;

global using CadastroCliente.API.Domain.Exceptions;
global using Microsoft.AspNetCore.Diagnostics;
global using Microsoft.AspNetCore.Mvc;

global using CadastroCliente.API.Application.CQRS.Commands;

global using CadastroCliente.API.Application.Utility;