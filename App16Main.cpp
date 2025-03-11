#include "pch.h"
#include "App16Main.h"
#include "Common\DirectXHelper.h"
#include "3d routines\Transformations.h"

using namespace App16;
using namespace Windows::Foundation;
using namespace Windows::System::Threading;
using namespace Concurrency;

// La plantilla de la aplicación DirectX 12 está documentada en https://go.microsoft.com/fwlink/?LinkID=613670&clcid=0x409

// Carga e inicializa los activos de la aplicación cuando se carga la aplicación.
App16Main::App16Main()
{
	// TODO: Cambie la configuración del temporizador si desea usar un modo distinto al modo de timestep variable predeterminado.
	// p. ej. para una lógica de actualización de timestep fijo de 60 FPS, llame a:
	/*
	m_timer.SetFixedTimeStep(true);
	m_timer.SetTargetElapsedSeconds(1.0 / 60);
	*/
}

// Crea e inicializa los representadores.
void App16Main::CreateRenderers(const std::shared_ptr<DX::DeviceResources>& deviceResources)
{
	// TODO: Reemplácelo por la inicialización del contenido de su aplicación.
	m_sceneRenderer = std::unique_ptr<Sample3DSceneRenderer>(new Sample3DSceneRenderer(deviceResources));

	OnWindowSizeChanged();
}

// Actualiza el estado de la aplicación una vez por marco.
void App16Main::Update()
{
	// Actualizar los objetos de la escena.
	m_timer.Tick([&]()
	{
		// TODO: Reemplácelo por las funciones de actualización de contenido de su aplicación.
		m_sceneRenderer->Update(m_timer);
	});
}

// Presenta el marco actual de acuerdo con el estado actual de la aplicación.
// Devuelve true si se ha presentado el marco y está listo para ser mostrado.
bool App16Main::Render()
{
	// No intente presentar nada antes de la primera actualización.
	if (m_timer.GetFrameCount() == 0)
	{
		return false;
	}

	// Presentar los objetos de la escena.
	// TODO: Reemplácelo por las funciones de representación de contenido de su aplicación.
	return m_sceneRenderer->Render();
}

// Actualiza el estado de la aplicación cuando cambia el tamaño de la ventana (por ejemplo, al cambiar la orientación del dispositivo)
void App16Main::OnWindowSizeChanged()
{
	// TODO: Reemplácelo por la inicialización dependiente del tamaño del contenido de su aplicación.
	m_sceneRenderer->CreateWindowSizeDependentResources();
}

// Notifica la aplicación que se va a suspender.
void App16Main::OnSuspending()
{
	// TODO: Reemplace este valor por la lógica de suspensión de su aplicación.

	// La Administración del ciclo de vida de los procesos puede finalizar las aplicaciones suspendidas en cualquier momento, por lo que
	// se recomienda guardar todos los estados que permitan reiniciar la aplicación donde se detuvo.

	m_sceneRenderer->SaveState();

	// Si su aplicación utiliza asignaciones de memoria de vídeo que se pueden volver a crear fácilmente,
	// considere la posibilidad de liberar dicha memoria para que esté disponible para otras aplicaciones.
}

// Notifica la aplicación que ya no está en suspensión.
void App16Main::OnResuming()
{
	// TODO: Reemplace este valor por la lógica de reanudación de su aplicación.
}

// Notifica a los representadores que deben liberarse recursos del dispositivo.
void App16Main::OnDeviceRemoved()
{
	// TODO: Guarde cualquier estado del representador y aplicación necesaria y libere el representador
	// y los recursos que ya no sean válidos.
	m_sceneRenderer->SaveState();
	m_sceneRenderer = nullptr;
}
