import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { EvaluacionformComponent } from './evaluacionform.component';

describe('EvaluacionformComponent', () => {
  let component: EvaluacionformComponent;
  let fixture: ComponentFixture<EvaluacionformComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ EvaluacionformComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(EvaluacionformComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should be created', () => {
    expect(component).toBeTruthy();
  });
});
